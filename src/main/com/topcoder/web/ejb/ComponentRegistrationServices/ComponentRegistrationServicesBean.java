package com.topcoder.web.ejb.ComponentRegistrationServices;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ComponentRegistrationServicesBean extends BaseEJB {

    private final static Logger log = Logger.getLogger(ComponentRegistrationServicesBean.class);

    public boolean isUserRegistered(long projectId, long userId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        boolean userRegistered = false;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);

            query.append("select '1' ");
            query.append("from component_inquiry ci ");
            query.append("where ci.project_id = ? ");
            query.append("and ci.user_id = ?");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);
            ps.setLong(2, userId);

            rs = ps.executeQuery();
            userRegistered = rs.next();
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return userRegistered;
    }

    public boolean hasUserReviewedProject(long projectId, long userId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        boolean hasReviewed = false;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);

            //this checks that the user is eligible to register for a project, based on
            //whether or not they have reviewed the project previously, and the
            //repost status of the project

            query.append("select 1 ");
            query.append("from resource rur, resource_info ri ");
            query.append("where rur.resource_role_id in (4, 5, 6, 7) "); // reviewer and test case reviewer
            query.append("and rur.resource_id = ri.resource_id and ri.resource_info_type_id = 1 and ri.value = ? ");
            query.append("and rur.project_id = ? ");
            query.append("and not exists (select p2.project_id from project p2, project_info pi2  ");
            query.append("where p2.project_id = pi2.project_id and pi2.project_info_type_id = 1 ");
            query.append("and pi2.value = (select value from project_info where project_id = ? and project_info_type_id = 1) ");
            query.append("and p2.project_status_id in (4,5,6) ");
            query.append("and p2.project_category_id = (select project_category_id from project where project_id = ?)) ");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, userId);
            ps.setLong(2, projectId);
            ps.setLong(3, projectId);
            ps.setLong(4, projectId);

            rs = ps.executeQuery();
            hasReviewed = rs.next();
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return hasReviewed;
    }

    public boolean isUserWinningDesigner(long projectId, long userId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        boolean isWinningDesigner = false;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);

            //this checks if the user is the winning designer for the project

            query.append("select 1 ");
            query.append("from project_result pr, project p, project_info pi ");
            query.append("where p.project_id = pr.project_id and p.project_id = pi.project_id and pi.project_info_type_id = 1 ");
            query.append("and pr.placed = 1 ");
            query.append("and pr.passed_review_ind = 1 ");
            query.append("and p.project_status_id = 1 ");
            query.append("and pi.value = (select value from project_info where project_id = ? and project_info_type_id = 1) ");
            query.append("and pr.user_id = ? ");
            query.append("and p.project_category_id = 1 ");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);
            ps.setLong(2, userId);

            rs = ps.executeQuery();
            isWinningDesigner = rs.next();
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return isWinningDesigner;
    }

    public boolean isRegOpen(long projectId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        boolean regOpen = false;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);

            query.append("select '1' ");
            query.append("from project p ");
            query.append(", project_phase pi1 ");
            query.append("where p.project_id = ? ");
            query.append("and pi1.project_id = p.project_id ");
            query.append("and pi1.phase_type_id = 1 ");
            query.append("and pi1.scheduled_end_time > current ");
            query.append("and pi1.scheduled_start_time < current ");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);

            rs = ps.executeQuery();
            regOpen = rs.next();
            
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return regOpen;
    }

    public int getMaxUnratedRegistrants(long projectId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        int max_reg = 1000;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);

            query.append("select 1000 as max_unrated_registrants ");
            query.append("from project p ");
            query.append("where p.project_id = ? ");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);

            rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getObject("max_unrated_registrants") != null) {
                    max_reg = rs.getInt("max_unrated_registrants");
                }
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return max_reg;
    }

    public int getMaxRatedRegistrants(long projectId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        int max_reg = 1000;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);


            query.append("select 1000 as max_rated_registrants ");
            query.append("from project p ");
            query.append("where p.project_id = ? ");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);

            rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getObject("max_rated_registrants") != null) {
                    max_reg = rs.getInt("max_rated_registrants");
                }
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return max_reg;
    }

    public int getRatedRegistrantCount(long projectId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        int reg_count = 0;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);

            query.append("select count(distinct user_id) ");
            query.append("from component_inquiry ci ");
            query.append("where ci.project_id = ? and rating <> 0");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);

            rs = ps.executeQuery();
            if (rs.next()) {
                reg_count = rs.getInt(1);
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return reg_count;
    }

    public int getUnratedRegistrantCount(long projectId, String dataSource) throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        int reg_count = 0;

        InitialContext ctx = null;

        try {

            conn = DBMS.getConnection(dataSource);

            StringBuffer query = new StringBuffer(1024);

            query.append("select count(distinct user_id) ");
            query.append("from component_inquiry ci ");
            query.append("where ci.project_id = ? and rating = 0");

            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, projectId);

            rs = ps.executeQuery();
            if (rs.next()) {
                reg_count = rs.getInt(1);
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return reg_count;
    }

    public ResultSetContainer getActiveQuestions() throws EJBException {
        return selectSet("comp_reg_question",
                new String[]{"comp_reg_question_id", "question_text", "question_style_id", "is_required"},
                new String[]{"is_active"},
                new String[]{"1"},
                DBMS.TCS_OLTP_DATASOURCE_NAME);
    }

    public ResultSetContainer getActiveAnswers() throws EJBException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        InitialContext ctx = null;

        try {
            conn = DBMS.getConnection(DBMS.TCS_OLTP_DATASOURCE_NAME);

            StringBuffer query = new StringBuffer(1024);

            query.append("select a.comp_reg_answer_id, a.comp_reg_question_id, a.answer_text, a.sort_order ");
            query.append("from comp_reg_answer a, comp_reg_question q ");
            query.append("where a.comp_reg_question_id = q.comp_reg_question_id ");
            query.append("and q.is_active = 1");
            query.append("order by comp_reg_question_id, sort_order");

            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();
            return new ResultSetContainer(rs);
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (Exception e) {
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public ResultSetContainer getAnswers(long questionId) throws EJBException {
        return selectSet("comp_reg_answer",
                new String[]{"comp_reg_answer_id", "comp_reg_question_id", "answer_text", "sort_order"},
                new String[]{"comp_reg_question_id", "is_active"},
                new String[]{String.valueOf(questionId), "1"},
                DBMS.TCS_OLTP_DATASOURCE_NAME);
    }

    public void createResponse(long projectId, long userId, long questionId, long answerId) throws EJBException {
        insert("comp_reg_response",
                new String[]{"comp_reg_question_id", "comp_reg_answer_id", "user_id", "project_id"},
                new String[]{String.valueOf(questionId), String.valueOf(answerId),
                        String.valueOf(userId), String.valueOf(projectId)},
                DBMS.TCS_OLTP_DATASOURCE_NAME);
    }

    public void createResponse(long projectId, long userId, long questionId, String text) throws EJBException {
        insert("comp_reg_response",
                new String[]{"comp_reg_question_id", "response_text", "user_id", "project_id"},
                new String[]{String.valueOf(questionId), text,
                        String.valueOf(userId), String.valueOf(projectId)},
                DBMS.TCS_OLTP_DATASOURCE_NAME);
    }

    public boolean responseExists(long projectId, long userId, long questionId) throws EJBException {
        PreparedStatement ps = null;
        Connection conn = null;
        InitialContext ctx = null;

        try {
            conn = DBMS.getConnection(DBMS.TCS_OLTP_DATASOURCE_NAME);
            ps = conn.prepareStatement("SELECT '1' FROM comp_reg_response " +
                    "WHERE project_id = ? AND user_id = ? AND comp_reg_question_id = ?");
            ps.setLong(1, projectId);
            ps.setLong(2, userId);
            ps.setLong(3, questionId);

            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (Exception e) {
            throw new EJBException(e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    private static final String reliableEnough =
            " select count(*)" +
              " from component_inquiry ci" +
                 " , project_phase pi" +
             " where ci.project_id = pi.project_id" +
               " and pi.phase_type_id = 2 " +
               " and ci.phase = ?" +
               " and ci.user_id = ?" +
               " and pi.actual_end_time > current";

    public boolean isUserReliableEnough(long phaseId, long userId, String dataSource) throws EJBException {
        //if their reliability is < 70 %
        //if they have more than two registrations
        //return false
        Double reliability = null;
        try {
            reliability = selectDouble("user_reliability", "rating", new String[]{"phase_id", "user_id"},
                    new String[]{String.valueOf(phaseId), String.valueOf(userId)}, dataSource);
        } catch (RowNotFoundException e) {
            reliability = new Double(0d);
        }
        if (reliability.compareTo(new Double(ComponentRegistrationServices.MIN_RELIABLE_PERCENTAGE)) < 0) {
            PreparedStatement ps = null;
            ResultSet rs = null;
            Connection conn = null;
            try {
                conn = DBMS.getConnection(dataSource);
                ps = conn.prepareStatement(reliableEnough);
                ps.setLong(1, phaseId);
                ps.setLong(2, userId);
                rs = ps.executeQuery();
                rs.next();
                if (rs.getInt(1) >= ComponentRegistrationServices.MAX_PROJECTS_WHEN_UNRELIABLE) {
                    return false;
                }
            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
                throw new EJBException(e);
            } catch (Exception e) {
                throw new EJBException(e);
            } finally {
                close(rs);
                close(ps);
                close(conn);
            }
        }
        return true;

    }
}
