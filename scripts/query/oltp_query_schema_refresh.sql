INSERT INTO command VALUES(0,'none',1);
INSERT INTO command VALUES(22,"query_metadata",1);
INSERT INTO command VALUES(23,"job_log",1);
INSERT INTO command VALUES(24,"recent_jobs",1);
INSERT INTO command VALUES(25,"jobs_by_date",1);
INSERT INTO command VALUES(26,"jobs_by_sender",1);
INSERT INTO command VALUES(27,"jobs_by_subject",1);
INSERT INTO command VALUES(28,"query_description",1);
INSERT INTO command VALUES(30,"email_queries",1);
INSERT INTO command VALUES(31,'Next Competition',1);
INSERT INTO command VALUES(32,'Member Development or Employment Opportunities',1);
INSERT INTO command VALUES(33,'authenticate_data_user',3);
INSERT INTO command VALUES(34,'school_membership',2);
INSERT INTO command VALUES(35,'Competition Results',1);
INSERT INTO command VALUES(36,'TopCoder News and Events',1);
INSERT INTO command VALUES(37,'Prize Winner',1);
INSERT INTO command VALUES(38,'pro_interest_graph',2);
INSERT INTO command VALUES(39,'student_interest_graph',2);
INSERT INTO command VALUES(40,'pro_industry_graph',2);
INSERT INTO command VALUES(41,'pro_title_graph',2);
INSERT INTO command VALUES(42,'pro_area_interest_graph',2);
INSERT INTO command VALUES(43,'student_referral_graph',2);
INSERT INTO command VALUES(44,'pro_referral_graph',2);
INSERT INTO command VALUES(45,'profile_list',4);
INSERT INTO command VALUES(46,'profile_list_menu',4);
INSERT INTO command (command_id, command_desc, command_group_id) VALUES ( 47, 'Top Input Rated', 1 );
INSERT INTO command VALUES(48,'profile_detail',4);
INSERT INTO command VALUES(49,'Email all TopCoder members',1);
INSERT INTO command VALUES(50,'sponsor_image',7);
INSERT INTO command VALUES(51,'Rated Members w/ Activation Code',1);
INSERT INTO command VALUES(52,'Members that said Yes to Sun Network Event',1);
INSERT INTO command VALUES(53,'Invitational Group 1',1);
INSERT INTO command VALUES(54,'Invitational Group 2',1);
INSERT INTO command VALUES(55,'Invitational Group 3',1);
INSERT INTO command VALUES(56,'Invitational Group 4',1);
INSERT INTO command VALUES(57,'Invitational Group 5',1);
INSERT INTO command VALUES(58,'Invitational Group 6',1);
INSERT INTO command VALUES(1000,"tces_main",8);
INSERT INTO command VALUES(1001,"tces_campaign_detail",8);
INSERT INTO command VALUES(1002,"tces_campaign_interest",8);
INSERT INTO command VALUES(1003,"tces_position_interest",8);
INSERT INTO command VALUES(1004,"tces_campaign_demographics",8);
INSERT INTO command VALUES(1005,"tces_position_demographics",8);
INSERT INTO command VALUES(1010,"tces_member_profile",8);
INSERT INTO command VALUES(1011,"tces_problem_submissions",8);
INSERT INTO command VALUES(1012,"tces_member_demographics",8);
INSERT INTO command VALUES(1013,"tces_competition_history",8);
INSERT INTO command VALUES(1014,"tces_competition_statistics",8);
INSERT INTO command VALUES(1015,"tces_problem_statistics",8);
INSERT INTO command VALUES(1016,"tces_problem_statement",8);
INSERT INTO command VALUES(1017,"tces_member_interest",8);
INSERT INTO command VALUES(1100,"tces_user_and_pw",8);
INSERT INTO command VALUES(1101,"tces_verify_member_access",8);
INSERT INTO command VALUES(1500,"member_profile_info",9);
INSERT INTO command VALUES(1501,"member_demographics",9);
INSERT INTO command VALUES(59,"TCES Notification",1);
INSERT INTO command VALUES(60,"invitational_info",10);
INSERT INTO command VALUES(61,"IMLP Targeted School List",1);



INSERT INTO data_type VALUES (1001,'Integer Input');
INSERT INTO data_type VALUES (1002,'Decimal Input');
INSERT INTO data_type VALUES (1003,'Date Input');
INSERT INTO data_type VALUES (1004,'Sort Direction');
INSERT INTO data_type VALUES (1005,'String');


INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(22,50,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(23,57,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(24,52,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(25,53,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(26,54,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(27,55,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(28,56,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(30,51,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(33,60,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(34,63,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(35,61,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(36,62,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(37,64,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(38,65,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(39,65,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(40,65,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(41,65,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(42,65,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(43,66,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(44,66,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(45,67,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(45,68,2);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(45,69,3);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(45,72,4);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(46,67,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(46,68,2);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(46,69,3);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(46,72,4);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(47,70,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(48,71,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(49,73,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(50,74,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(51,75,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(52,76,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(53,77,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(54,78,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(55,79,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(56,80,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(57,81,1);
INSERT INTO command_query_xref (command_id, query_id, sort_order) VALUES(58,82,1);
INSERT INTO command_query_xref VALUES(1000, 1000, 1);
INSERT INTO command_query_xref VALUES(1000, 1001, 2);
INSERT INTO command_query_xref VALUES(1001, 1000, 1);
INSERT INTO command_query_xref VALUES(1001, 1002, 2);
INSERT INTO command_query_xref VALUES(1001, 1003, 3);
INSERT INTO command_query_xref VALUES(1001, 1004, 4);
INSERT INTO command_query_xref VALUES(1001, 1099, 5);
INSERT INTO command_query_xref VALUES(1002, 1000, 1);
INSERT INTO command_query_xref VALUES(1002, 1002, 2);
INSERT INTO command_query_xref VALUES(1002, 1005, 3);
INSERT INTO command_query_xref VALUES(1002, 1099, 4);
INSERT INTO command_query_xref VALUES(1003, 1000, 1);
INSERT INTO command_query_xref VALUES(1003, 1002, 2);
INSERT INTO command_query_xref VALUES(1003, 1006, 3);
INSERT INTO command_query_xref VALUES(1003, 1007, 4);
INSERT INTO command_query_xref VALUES(1003, 1098, 5);
INSERT INTO command_query_xref VALUES(1004, 1000, 7);
INSERT INTO command_query_xref VALUES(1004, 1002, 1);
INSERT INTO command_query_xref VALUES(1004, 1008, 2);
INSERT INTO command_query_xref VALUES(1004, 1009, 3);
INSERT INTO command_query_xref VALUES(1004, 1010, 4);
INSERT INTO command_query_xref VALUES(1004, 1011, 5);
INSERT INTO command_query_xref VALUES(1004, 1099, 6);
INSERT INTO command_query_xref VALUES(1005, 1000, 8);
INSERT INTO command_query_xref VALUES(1005, 1002, 1);
INSERT INTO command_query_xref VALUES(1005, 1006, 2);
INSERT INTO command_query_xref VALUES(1005, 1012, 3);
INSERT INTO command_query_xref VALUES(1005, 1013, 4);
INSERT INTO command_query_xref VALUES(1005, 1014, 5);
INSERT INTO command_query_xref VALUES(1005, 1015, 6);
INSERT INTO command_query_xref VALUES(1005, 1098, 7);
INSERT INTO command_query_xref VALUES(1010, 1050, 1);
INSERT INTO command_query_xref VALUES(1010, 1006, 2);
INSERT INTO command_query_xref VALUES(1010, 1051, 3);
INSERT INTO command_query_xref VALUES(1010, 1097, 4);
INSERT INTO command_query_xref VALUES(1010, 1000, 5);
INSERT INTO command_query_xref VALUES(1011, 1050, 1);
INSERT INTO command_query_xref VALUES(1011, 1097, 2);
INSERT INTO command_query_xref VALUES(1012, 1050, 1);
INSERT INTO command_query_xref VALUES(1012, 1052, 2);
INSERT INTO command_query_xref VALUES(1012, 1097, 3);
INSERT INTO command_query_xref VALUES(1013, 1050, 1);
INSERT INTO command_query_xref VALUES(1013, 1097, 2);
INSERT INTO command_query_xref VALUES(1014, 1050, 1);
INSERT INTO command_query_xref VALUES(1014, 1097, 2);
INSERT INTO command_query_xref VALUES(1015, 1050, 1);
INSERT INTO command_query_xref VALUES(1015, 1097, 2);
INSERT INTO command_query_xref VALUES(1016, 1097, 1);
INSERT INTO command_query_xref VALUES(1017, 1000, 1);
INSERT INTO command_query_xref VALUES(1017, 1002, 2);
INSERT INTO command_query_xref VALUES(1017, 1050, 3);
INSERT INTO command_query_xref VALUES(1017, 1053, 4);
INSERT INTO command_query_xref VALUES(1017, 1097, 5);
INSERT INTO command_query_xref VALUES(1100, 1100, 1);
INSERT INTO command_query_xref VALUES(1101, 1097, 1);
INSERT INTO command_query_xref VALUES(1500, 1051, 1);
INSERT INTO command_query_xref VALUES(1501, 1052, 1);
INSERT INTO command_query_xref VALUES(59, 83, 1);
INSERT INTO command_query_xref VALUES(60, 84, 1);
INSERT INTO command_query_xref VALUES(60, 86, 1);
INSERT INTO command_query_xref VALUES(61, 87, 1);


INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(3,"cr",1001,"Coder ID");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(5,"sd",1003,"Start date");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(6,"ed",1003,"End date");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(7,"nr",1001,"Number of records");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(8,"sr",1001,"Start rank");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(9,"er",1001,"End rank");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(18,"ci",1001,"Command ID");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(19,"ji",1001,"Job ID");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(20,"email",1005,"E-mail Address");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(21,"subject",1005,"Subject");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(22,"sector",1005,"Sector Desc");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(23,"rd",1001,"Round ID");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(24,"ct",1001,"Coder Type Id");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(25,"dq",1001,"Demographic Question Id");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(27,"rn",1001,"min rating");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(28,"rx",1001,"max rating");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(29,"ha",1005,"handle");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(30,"scs",1005,"state codes");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(32,"nrn",1001,"min num ratings");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(33,"nrx",1001,"max num ratings");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(34,"gn",1001,"min grad year");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(35,"gx",1001,"max grad year");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(36,"cts",1005,"coder types");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(37,"fn",1005,"first name");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(38,"ln",1005,"last name");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(39,'top',1001,'No of Top Rated Coders');
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(40,'ais',1001,'answer id');
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(41,'cm',1001,'company id');
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES(42,'it',1001,'image type id');
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES (1000, "uid", 1001, "TCES User ID");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES (1001, "cid", 1001, "TCES Campaign ID");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES (1002, "jid", 1001, "TCES Job ID");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES (1003, "mid", 1001, "TCES Member ID");
INSERT INTO input_lu (input_id, input_code, data_type_id, input_desc) VALUES (1100, "hn", 1005, "User Handle");


INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(50,"N",null,18,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(52,"N",null,5,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(53,"N",null,5,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(53,"N",null,6,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(54,"N",null,20,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(55,"N",null,21,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(56,"N",null,18,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(57,"N",null,19,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(57,"Y","1",8,2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(57,"Y","50",9,3);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(60,'N',null,22,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(60,'N',null,3,2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(64,'N',null,23,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(65,'N',null,24,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(65,'N',null,25,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(66,'N',null,24,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(69,'Y',"1,2",36,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(69,'Y',"0",34,2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(69,'Y',"10000",35,3);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(69,'Y',"%",29,4);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(69,'N',null,30,5);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(69,'Y',"-2147483648",27,7);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(69,'Y',"2147483647",28,8);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(69,'Y',"0",32,9);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(69,'Y',"2147483647",33,10);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(69,'Y',"%",37,11);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(69,'Y',"%",38,12);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(69,'N',"12,13,14",40,13);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(70,'N',null,39,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(71,'N',null,3,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(74,'N',null,41,1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES(74,'N',null,42,2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1000, "N", null, 1000, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1001, "N", null, 1000, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1002, "N", null, 1001, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1003, "N", null, 1001, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1004, "N", null, 1001, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1005, "N", null, 1001, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1006, "N", null, 1002, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1007, "N", null, 1002, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1008, "N", null, 1001, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1008, "N", null, 24, 2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1009, "N", null, 1001, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1009, "N", null, 24, 2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1010, "N", null, 1001, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1010, "N", null, 24, 2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1011, "N", null, 1001, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1011, "N", null, 24, 2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1012, "N", null, 1002, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1012, "N", null, 24, 2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1013, "N", null, 1002, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1013, "N", null, 24, 2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1014, "N", null, 1002, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1014, "N", null, 24, 2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1015, "N", null, 1002, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1015, "N", null, 24, 2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1050, "N", null, 1003, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1051, "N", null, 1003, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1052, "N", null, 1003, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1053, "N", null, 1001, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1053, "N", null, 1003, 2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1097, "N", null, 1000, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1097, "N", null, 1001, 2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1097, "N", null, 1002, 3);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1097, "N", null, 1003, 4);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1098, "N", null, 1000, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1098, "N", null, 1001, 2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1098, "N", null, 1002, 3);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1099, "N", null, 1000, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1099, "N", null, 1001, 2);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (1100, "N", null, 1100, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (84, "N", null, 3, 1);
INSERT INTO query_input_xref (query_id, optional, default_value, input_id, sort_order) VALUES (86, "N", null, 3, 1);
