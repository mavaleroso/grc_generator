/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : qrc_db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-06-04 08:52:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `classifications`
-- ----------------------------
DROP TABLE IF EXISTS `classifications`;
CREATE TABLE `classifications` (
  `class_id` int(100) NOT NULL AUTO_INCREMENT,
  `class_code` varchar(40) DEFAULT NULL,
  `class_description` mediumtext DEFAULT NULL,
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of classifications
-- ----------------------------
INSERT INTO `classifications` VALUES ('1', 'A', 'Administrative Records');
INSERT INTO `classifications` VALUES ('2', 'F', 'Financial Records');
INSERT INTO `classifications` VALUES ('3', 'L', 'Legal Records');
INSERT INTO `classifications` VALUES ('4', 'P', 'Personnel Records');
INSERT INTO `classifications` VALUES ('5', 'S', 'Social Services Records');

-- ----------------------------
-- Table structure for `divisions`
-- ----------------------------
DROP TABLE IF EXISTS `divisions`;
CREATE TABLE `divisions` (
  `div_id` int(40) NOT NULL AUTO_INCREMENT,
  `div_code` varchar(100) DEFAULT NULL,
  `div_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`div_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of divisions
-- ----------------------------
INSERT INTO `divisions` VALUES ('1', 'ORD', 'Office of Regional Director');
INSERT INTO `divisions` VALUES ('2', 'FMD', 'Financial Management Division');
INSERT INTO `divisions` VALUES ('3', 'AD', 'Administrative Division');
INSERT INTO `divisions` VALUES ('4', 'HRMD', 'Human Resource Management Division');
INSERT INTO `divisions` VALUES ('5', 'PPD', 'Policy and Plans Division');
INSERT INTO `divisions` VALUES ('6', 'PTSD', 'Protective Services Division');
INSERT INTO `divisions` VALUES ('7', 'PMSD', 'Promotive Services Division');
INSERT INTO `divisions` VALUES ('8', 'DRMD', 'Disaster Response Management Division');
INSERT INTO `divisions` VALUES ('9', 'OTHERS', 'LGUs, NGOs, NGAs, CO, FO, CSOs and etc.');

-- ----------------------------
-- Table structure for `sections`
-- ----------------------------
DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections` (
  `sec_id` int(40) NOT NULL AUTO_INCREMENT,
  `div_id` int(40) NOT NULL,
  `sec_code` varchar(50) DEFAULT NULL,
  `sec_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sec_id`) USING BTREE,
  KEY `FK_sections_divisions` (`div_id`) USING BTREE,
  CONSTRAINT `FK_sections_divisions` FOREIGN KEY (`div_id`) REFERENCES `divisions` (`div_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sections
-- ----------------------------
INSERT INTO `sections` VALUES ('1', '1', 'IAS', 'Internal Audit Section');
INSERT INTO `sections` VALUES ('2', '1', 'LS', 'Legal Services Section');
INSERT INTO `sections` VALUES ('3', '1', 'SMS', 'Social Marketing Section');
INSERT INTO `sections` VALUES ('4', '1', 'SOCT', 'Social Technology Section');
INSERT INTO `sections` VALUES ('5', '1', 'TARA', 'Technical Assistance and Resource Augmentation Section');
INSERT INTO `sections` VALUES ('6', '2', 'ACCTG', 'Accounting Section');
INSERT INTO `sections` VALUES ('7', '2', 'BS', 'Budget Section');
INSERT INTO `sections` VALUES ('8', '2', 'CS', 'Cash Section');
INSERT INTO `sections` VALUES ('9', '3', 'GS', 'General Services Section');
INSERT INTO `sections` VALUES ('10', '3', 'RS', 'Records Section');
INSERT INTO `sections` VALUES ('11', '3', 'PROC', 'Procurement Section');
INSERT INTO `sections` VALUES ('12', '3', 'PROP', 'Propery Section');
INSERT INTO `sections` VALUES ('13', '4', 'LDS', 'Learning & Development Section');
INSERT INTO `sections` VALUES ('14', '4', 'HRW', 'Human Resource Welfare Section');
INSERT INTO `sections` VALUES ('15', '4', 'PER', 'Personnel Section');
INSERT INTO `sections` VALUES ('16', '4', 'HRPPM', 'Human Resource PP Management Section');
INSERT INTO `sections` VALUES ('17', '5', 'ICTMS', 'Information Communication Technology Management Section');
INSERT INTO `sections` VALUES ('18', '5', 'PDPS', 'Planning Section');
INSERT INTO `sections` VALUES ('19', '5', 'NHTS', 'National Household Targeting Section');
INSERT INTO `sections` VALUES ('20', '5', 'UCT', 'Unknown');
INSERT INTO `sections` VALUES ('21', '5', 'STND', 'Standards Section');
INSERT INTO `sections` VALUES ('22', '6', 'CBS', 'Capability Building Section');
INSERT INTO `sections` VALUES ('23', '6', 'CI', 'Cennter Based & Institutions Section');
INSERT INTO `sections` VALUES ('24', '6', 'COMB', 'Community Based Section');
INSERT INTO `sections` VALUES ('25', '6', 'CIS', 'Crisis Intervention Section');
INSERT INTO `sections` VALUES ('26', '6', 'SWAD', 'Social Welfare and Development Section');
INSERT INTO `sections` VALUES ('27', '7', 'KC', 'Kapit Bisig Laban sa Hairapan Comprehensive and Integrated Delivery of Social Services (KALAHI-CIDSS)');
INSERT INTO `sections` VALUES ('28', '7', 'SLP', 'Sustainable Livelihood Program');
INSERT INTO `sections` VALUES ('29', '7', 'PPPP', 'Pantawid Pamilyang Pilipino Program');
INSERT INTO `sections` VALUES ('30', '8', 'DRRS', 'Disaster Rescue & Response Section');
INSERT INTO `sections` VALUES ('31', '8', 'DRIM', 'Disaster Response Information Management');
INSERT INTO `sections` VALUES ('32', '8', 'RRO', 'Rescue & Response Operation');

-- ----------------------------
-- Table structure for `sub_classifications`
-- ----------------------------
DROP TABLE IF EXISTS `sub_classifications`;
CREATE TABLE `sub_classifications` (
  `sclass_id` int(100) NOT NULL AUTO_INCREMENT,
  `class_id` int(40) DEFAULT NULL,
  `sclass_code` varchar(255) DEFAULT NULL,
  `sclass_description` longtext DEFAULT NULL,
  PRIMARY KEY (`sclass_id`) USING BTREE,
  KEY `class_id` (`class_id`) USING BTREE,
  CONSTRAINT `sub_classifications_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classifications` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sub_classifications
-- ----------------------------
INSERT INTO `sub_classifications` VALUES ('1', '1', 'AR', 'Acknowledgement Rceipts');
INSERT INTO `sub_classifications` VALUES ('2', '1', 'APP', 'Applications');
INSERT INTO `sub_classifications` VALUES ('3', '1', 'BID', 'Bidding Documents');
INSERT INTO `sub_classifications` VALUES ('8', '2', 'ABST', 'Abstract of Sub-Vouchers(GF 26-A)');
INSERT INTO `sub_classifications` VALUES ('9', '2', 'AR', 'Acknowledgement Receipts (Claims)');
INSERT INTO `sub_classifications` VALUES ('10', '2', 'ADV', 'Advices');
INSERT INTO `sub_classifications` VALUES ('11', '3', 'AOL', 'Affidavit of Loss');
INSERT INTO `sub_classifications` VALUES ('12', '3', 'CASE', 'Cases');
INSERT INTO `sub_classifications` VALUES ('13', '3', 'CTDF', 'Case Tapes/Documentary Films');
INSERT INTO `sub_classifications` VALUES ('14', '4', 'APP', 'Applications');
INSERT INTO `sub_classifications` VALUES ('15', '4', 'CA', 'Certificates of Appearance');
INSERT INTO `sub_classifications` VALUES ('16', '4', 'CHAR', 'Charts');
INSERT INTO `sub_classifications` VALUES ('17', '5', 'ADOP', 'Adoption Files');
INSERT INTO `sub_classifications` VALUES ('18', '5', 'APP', 'Applications');
INSERT INTO `sub_classifications` VALUES ('19', '5', 'BOOK', 'Books');
INSERT INTO `sub_classifications` VALUES ('20', '1', 'BOL', 'Bills of Lading');
INSERT INTO `sub_classifications` VALUES ('21', '1', 'BOM', 'Bills of Materials');
INSERT INTO `sub_classifications` VALUES ('22', '1', 'BLOT', 'Blotter for Arrival/Departure');
INSERT INTO `sub_classifications` VALUES ('23', '1', 'BP', 'Building Plans');
INSERT INTO `sub_classifications` VALUES ('24', '1', 'COP', 'Canvass of Prices');
INSERT INTO `sub_classifications` VALUES ('25', '1', 'CER', 'Certificates');
INSERT INTO `sub_classifications` VALUES ('26', '1', 'DRP', 'Declaration of Real Properties');
INSERT INTO `sub_classifications` VALUES ('27', '1', 'DEED', 'Deeds');
INSERT INTO `sub_classifications` VALUES ('28', '1', 'DR', 'Delivery Receipts');
INSERT INTO `sub_classifications` VALUES ('29', '1', 'DIR', 'Directive/Issuances');
INSERT INTO `sub_classifications` VALUES ('30', '1', 'DON', 'Donations');
INSERT INTO `sub_classifications` VALUES ('31', '1', 'ELC', 'Equipment Ledger Cards');
INSERT INTO `sub_classifications` VALUES ('32', '1', 'GCS', 'Gasoline Consumption Slips');
INSERT INTO `sub_classifications` VALUES ('33', '1', 'GP', 'Gate Passes');
INSERT INTO `sub_classifications` VALUES ('34', '1', 'COMM', 'General Correspondence/Communications(routinary)');
INSERT INTO `sub_classifications` VALUES ('35', '1', 'CCF', 'IBM Cards and Continuous Forms');
INSERT INTO `sub_classifications` VALUES ('36', '1', 'IRS', 'Inspection Reports of Sale of Unserviceable Properties');
INSERT INTO `sub_classifications` VALUES ('37', '1', 'INS', 'Insurances');
INSERT INTO `sub_classifications` VALUES ('38', '1', 'INV', 'Inventories');
INSERT INTO `sub_classifications` VALUES ('39', '1', 'IIR', 'Inventories and Inspection Reports of Unserviceable Properties (GF 17-A)');
INSERT INTO `sub_classifications` VALUES ('40', '1', 'IOR', 'Invoices of/and Receipts');
INSERT INTO `sub_classifications` VALUES ('41', '1', 'JO', 'Job Order');
INSERT INTO `sub_classifications` VALUES ('42', '1', 'LT', 'Land Titles');
INSERT INTO `sub_classifications` VALUES ('43', '1', 'LOG', 'Logbooks');
INSERT INTO `sub_classifications` VALUES ('44', '1', 'ML', 'Mailing Lists');
INSERT INTO `sub_classifications` VALUES ('45', '1', 'MCS', 'Management Control Studies');
INSERT INTO `sub_classifications` VALUES ('46', '1', 'MAP', 'Maps');
INSERT INTO `sub_classifications` VALUES ('47', '1', 'ARE', 'Memorandum/Acknowledgement Receipts for Equipment, Semi-Expandable and Non-expandable Properties (GF 32-A)');
INSERT INTO `sub_classifications` VALUES ('48', '1', 'MOM', 'Minute of Meetings');
INSERT INTO `sub_classifications` VALUES ('49', '1', 'PLAN', 'Plans');
INSERT INTO `sub_classifications` VALUES ('50', '1', 'PRESS', 'Press Release/News Clippings (About or by the agency)');
INSERT INTO `sub_classifications` VALUES ('51', '1', 'PHB', 'Proposed House Bills');
INSERT INTO `sub_classifications` VALUES ('52', '1', 'PO', 'Purchase Orders');
INSERT INTO `sub_classifications` VALUES ('53', '1', 'PR', 'Purchase Requests');
INSERT INTO `sub_classifications` VALUES ('54', '1', 'RPA', 'Reliefs from Property Accountability');
INSERT INTO `sub_classifications` VALUES ('55', '1', 'REP', 'Reports');
INSERT INTO `sub_classifications` VALUES ('56', '1', 'REQ', 'Requests');
INSERT INTO `sub_classifications` VALUES ('57', '1', 'RIS', 'Requisition and Issue Slips/Requisition Issue Vouchers covering emergency purchase of supplies (GF 45-A)');
INSERT INTO `sub_classifications` VALUES ('58', '1', 'RES', 'Requisition for Equipment/Supplies (BSC Form 1)');
INSERT INTO `sub_classifications` VALUES ('59', '1', 'RS', 'Routing Slips');
INSERT INTO `sub_classifications` VALUES ('60', '1', 'SOA', 'Schedule of Activities');
INSERT INTO `sub_classifications` VALUES ('61', '1', 'SHIP', 'Shipping and Packing Lists of Items from Dealers');
INSERT INTO `sub_classifications` VALUES ('62', '1', 'SCS', 'Stock Cards of Supplies');
INSERT INTO `sub_classifications` VALUES ('63', '1', 'SAS', 'Supplies Adjustment Sheets');
INSERT INTO `sub_classifications` VALUES ('64', '1', 'SLC', 'Supplies Ledger Cards');
INSERT INTO `sub_classifications` VALUES ('65', '1', 'TAX', 'Tax Declarations');
INSERT INTO `sub_classifications` VALUES ('66', '1', 'TEL', 'Telegrams');
INSERT INTO `sub_classifications` VALUES ('67', '1', 'TD', 'Travel Documents');
INSERT INTO `sub_classifications` VALUES ('68', '1', 'TRIP', 'Trip Tickets');
INSERT INTO `sub_classifications` VALUES ('69', '1', 'WP', 'Work Programs');
INSERT INTO `sub_classifications` VALUES ('70', '2', 'ALLO', 'Allotment Documents');
INSERT INTO `sub_classifications` VALUES ('71', '2', 'ALP', 'Alpha Listings of Income Tax');
INSERT INTO `sub_classifications` VALUES ('72', '2', 'AOM', 'Audit Observation Memorandum');
INSERT INTO `sub_classifications` VALUES ('73', '2', 'ASAP', 'Annual Statements of Accounts Payable');
INSERT INTO `sub_classifications` VALUES ('74', '2', 'BOND', 'Bonds of Indemnity for Issue of Due Warrants (GF 18-A)');
INSERT INTO `sub_classifications` VALUES ('75', '2', 'BFE', 'Books of Final Entry');
INSERT INTO `sub_classifications` VALUES ('76', '2', 'BOE', 'Books of Origin Entry');
INSERT INTO `sub_classifications` VALUES ('77', '2', 'BPE', 'Breakdown of Programs/Projects Expenditures');
INSERT INTO `sub_classifications` VALUES ('78', '2', 'BUDA', 'Budget Allocations');
INSERT INTO `sub_classifications` VALUES ('79', '2', 'BUDC', 'Budgetary Ceilings');
INSERT INTO `sub_classifications` VALUES ('80', '2', 'BUDE', 'Budget Estimates including Analysis Sheets and Estimates of Income');
INSERT INTO `sub_classifications` VALUES ('81', '2', 'CD', 'Cash Disbursements');
INSERT INTO `sub_classifications` VALUES ('82', '2', 'CRJ', 'Cash Receipts Journal');
INSERT INTO `sub_classifications` VALUES ('83', '2', 'CERT', 'Certificates');
INSERT INTO `sub_classifications` VALUES ('84', '2', 'CCS', 'Checks and Check Status');
INSERT INTO `sub_classifications` VALUES ('85', '2', 'CONT', 'Contingency Plans');
INSERT INTO `sub_classifications` VALUES ('86', '2', 'DCR', 'Daily Cash Reports');
INSERT INTO `sub_classifications` VALUES ('87', '2', 'DS', 'Deposit Slips');
INSERT INTO `sub_classifications` VALUES ('88', '2', 'DSUC', 'Detailed Statements of Unliquidated Cash Advances');
INSERT INTO `sub_classifications` VALUES ('89', '2', 'DSI', 'Details of Subsidy Income');
INSERT INTO `sub_classifications` VALUES ('90', '2', 'FRO', 'Financial Reports of Operations');
INSERT INTO `sub_classifications` VALUES ('91', '2', 'GA', 'General Appropriations');
INSERT INTO `sub_classifications` VALUES ('92', '2', 'GP', 'General Payrolls');
INSERT INTO `sub_classifications` VALUES ('93', '2', 'IOP', 'Index of Payments');
INSERT INTO `sub_classifications` VALUES ('94', '2', 'JEV', 'Journal Entry Vouchers');
INSERT INTO `sub_classifications` VALUES ('95', '2', 'JWI', 'Journals of Warrant Issued');
INSERT INTO `sub_classifications` VALUES ('96', '2', 'LIST', 'Lists');
INSERT INTO `sub_classifications` VALUES ('97', '2', 'MRI', 'Monthly Reports of Income');
INSERT INTO `sub_classifications` VALUES ('98', '2', 'MSMS', 'Monthly Settlements of Monthly Subsidiary Ledger Balance (GF 65-A)');
INSERT INTO `sub_classifications` VALUES ('99', '2', 'NGO', 'NGOs Annual Report and Financial Statements');
INSERT INTO `sub_classifications` VALUES ('100', '2', 'NOT', 'Notices');
INSERT INTO `sub_classifications` VALUES ('101', '2', 'OBS', 'Obligation Slips');
INSERT INTO `sub_classifications` VALUES ('102', '2', 'PDR', 'Parent\\\'s Donation Remittances');
INSERT INTO `sub_classifications` VALUES ('103', '2', 'PFPT', 'Physical Financial Plans and Targets');
INSERT INTO `sub_classifications` VALUES ('104', '2', 'PEB', 'Program Expenditures and Balances');
INSERT INTO `sub_classifications` VALUES ('105', '2', 'PSEL', 'Properties/Supplies/Equipment Ledger');
INSERT INTO `sub_classifications` VALUES ('106', '2', 'SCAP', 'Quarterly/Monthly Statements of Charges to Accounts Payable');
INSERT INTO `sub_classifications` VALUES ('107', '2', 'RECO', 'Reconciliation Statements');
INSERT INTO `sub_classifications` VALUES ('108', '2', 'RBCR', 'Registry Books of Check Issued');
INSERT INTO `sub_classifications` VALUES ('109', '2', 'RER', 'Reimbursement Expense Receipts (GF 3-A)');
INSERT INTO `sub_classifications` VALUES ('110', '2', 'RAT', 'Remittance Advices (GF 14-B) /Tax Remittance Advice');
INSERT INTO `sub_classifications` VALUES ('111', '2', 'REPS', 'Reports');
INSERT INTO `sub_classifications` VALUES ('112', '2', 'REQ', 'Requests');
INSERT INTO `sub_classifications` VALUES ('113', '2', 'SAP', 'Schedules of Accounts Payable (BF 304)');
INSERT INTO `sub_classifications` VALUES ('114', '2', 'SBUD', 'Special Budget');
INSERT INTO `sub_classifications` VALUES ('115', '2', 'STAT', 'Statements');
INSERT INTO `sub_classifications` VALUES ('116', '2', 'SAOB', 'Statements of Allotment, Obligations, and Balances');
INSERT INTO `sub_classifications` VALUES ('117', '2', 'SUOA', 'Summaries of Unliquidates Obligations and Accounts Payable');
INSERT INTO `sub_classifications` VALUES ('118', '2', 'SLCI', 'Summary Lists of Checks Issued');
INSERT INTO `sub_classifications` VALUES ('119', '2', 'SUN', 'Sundry Payments');
INSERT INTO `sub_classifications` VALUES ('120', '2', 'SIL', 'Supplies and Inventories Ledger');
INSERT INTO `sub_classifications` VALUES ('121', '2', 'SPJ', 'Supplies Purchase Journal (GF 81-A)');
INSERT INTO `sub_classifications` VALUES ('122', '2', 'SUPB', 'Supplemental Budget');
INSERT INTO `sub_classifications` VALUES ('123', '2', 'TBSS', 'Trial Balances and Supporting Schedules');
INSERT INTO `sub_classifications` VALUES ('124', '2', 'VOUC', 'Vouchers Incuding Bills, Invoices & other Supporting Documents');
INSERT INTO `sub_classifications` VALUES ('125', '2', 'WR', 'Warrant Registers');
INSERT INTO `sub_classifications` VALUES ('126', '2', 'WTC', 'Withholding Tax Certificates');
INSERT INTO `sub_classifications` VALUES ('127', '2', 'WFP', 'Work and Financial Plans');
INSERT INTO `sub_classifications` VALUES ('131', '3', 'PROC', 'Proceedings');
INSERT INTO `sub_classifications` VALUES ('132', '3', 'COMP', 'Complaints/Protests');
INSERT INTO `sub_classifications` VALUES ('133', '3', 'SUBP', 'Subpoenas');
INSERT INTO `sub_classifications` VALUES ('137', '4', 'COS', 'Contracts of Service');
INSERT INTO `sub_classifications` VALUES ('138', '4', 'DTR', 'Daily Time Records (CS Form 48)');
INSERT INTO `sub_classifications` VALUES ('139', '4', 'DOE', 'Directories of Officials/Employees');
INSERT INTO `sub_classifications` VALUES ('140', '4', 'EEIR', 'Employees Exit Interview Reports');
INSERT INTO `sub_classifications` VALUES ('141', '4', 'EIC', 'Employees Index Cards');
INSERT INTO `sub_classifications` VALUES ('142', '4', 'MEM', 'GIS, Medicare/Pag-ibig Memberships');
INSERT INTO `sub_classifications` VALUES ('143', '4', 'LCC', 'Leave Credit Cards');
INSERT INTO `sub_classifications` VALUES ('144', '4', 'LIST', 'Lists');
INSERT INTO `sub_classifications` VALUES ('145', '4', 'PAR', 'Performance Appraisal/Evaluation Rating Files');
INSERT INTO `sub_classifications` VALUES ('146', '4', 'PC', 'Performance Contracts');
INSERT INTO `sub_classifications` VALUES ('147', '4', 'PTW', 'Performance Target Worksheets');
INSERT INTO `sub_classifications` VALUES ('148', '4', 'PCAF', 'Personnel Comparative Assessment Forms');
INSERT INTO `sub_classifications` VALUES ('149', '4', 'PDS', 'Personal Data Sheets/Curriculum Vitae');
INSERT INTO `sub_classifications` VALUES ('150', '4', 'PERF', 'Personnel Folders (201 Files)');
INSERT INTO `sub_classifications` VALUES ('151', '4', 'POP', 'Plantillas of Personnel');
INSERT INTO `sub_classifications` VALUES ('152', '4', 'PCP', 'Position Classification Papers');
INSERT INTO `sub_classifications` VALUES ('153', '4', 'ROB', 'Recommendations for Employment');
INSERT INTO `sub_classifications` VALUES ('154', '4', 'REQ', 'Requests');
INSERT INTO `sub_classifications` VALUES ('155', '4', 'RALC', 'Requests for Accumulated Leave Credits');
INSERT INTO `sub_classifications` VALUES ('156', '4', 'SALN', 'Statements of Assets, Liabilities and Net Worth');
INSERT INTO `sub_classifications` VALUES ('157', '4', 'TRNG', 'Training Files');
INSERT INTO `sub_classifications` VALUES ('161', '5', 'BROC', 'Borchures');
INSERT INTO `sub_classifications` VALUES ('162', '5', 'CASE', 'Case Folders');
INSERT INTO `sub_classifications` VALUES ('163', '5', 'CERT', 'Certificates');
INSERT INTO `sub_classifications` VALUES ('164', '5', 'LOG', 'Control Logbooks for Minors Travelling Abroad');
INSERT INTO `sub_classifications` VALUES ('165', '5', 'DIR', 'Directories');
INSERT INTO `sub_classifications` VALUES ('166', '5', 'DIS', 'Disaster Statistics');
INSERT INTO `sub_classifications` VALUES ('167', '5', 'FDF', 'Foreign Donation Files');
INSERT INTO `sub_classifications` VALUES ('168', '5', 'ICF', 'Individual Case Folders');
INSERT INTO `sub_classifications` VALUES ('169', '5', 'INFO', 'Information Files');
INSERT INTO `sub_classifications` VALUES ('170', '5', 'LGUR', 'LGU Reports');
INSERT INTO `sub_classifications` VALUES ('171', '5', 'LGUP', 'LGU Plans Social Welfare Development Programs and Services');
INSERT INTO `sub_classifications` VALUES ('172', '5', 'LRA', 'License/Registration Accreditation Files');
INSERT INTO `sub_classifications` VALUES ('173', '5', 'LIST', 'Lists');
INSERT INTO `sub_classifications` VALUES ('174', '5', 'MLIS', 'Master Lists');
INSERT INTO `sub_classifications` VALUES ('175', '5', 'MOA', 'Memoranda of Agreement (MOA)');
INSERT INTO `sub_classifications` VALUES ('176', '5', 'MST', 'Modules/Syllabi of Training');
INSERT INTO `sub_classifications` VALUES ('177', '5', 'NEWS', 'News Letters');
INSERT INTO `sub_classifications` VALUES ('178', '5', 'PLAN', 'Plans');
INSERT INTO `sub_classifications` VALUES ('179', '5', 'PAM', 'Procedures on Advocacy Materials');
INSERT INTO `sub_classifications` VALUES ('180', '5', 'PROF', 'Profiles');
INSERT INTO `sub_classifications` VALUES ('181', '5', 'PPF', 'Programs/Projects Files');
INSERT INTO `sub_classifications` VALUES ('182', '5', 'REP', 'Reports');
INSERT INTO `sub_classifications` VALUES ('183', '5', 'RAW', 'Raw Data');
INSERT INTO `sub_classifications` VALUES ('184', '5', 'REF', 'Referrals');
INSERT INTO `sub_classifications` VALUES ('185', '5', 'RCS', 'Researches/Case Studies (Output)');
INSERT INTO `sub_classifications` VALUES ('186', '5', 'SOLP', 'Solicitation Permits');
INSERT INTO `sub_classifications` VALUES ('187', '5', 'STAT', 'Statistical Reports');
INSERT INTO `sub_classifications` VALUES ('188', '5', 'TSP', 'Training of Student Placement Files');
INSERT INTO `sub_classifications` VALUES ('189', '5', 'PROC', 'Trainings Proceedings');
INSERT INTO `sub_classifications` VALUES ('190', '5', 'WB', 'Weather Bulletin');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'mavaleroso', '12345', 'marwen valeroso', '2020-04-03 13:15:32');
