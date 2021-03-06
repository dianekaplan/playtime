﻿#
#
# Table structure for table 'specialinfo'
#

DROP TABLE IF EXISTS `specialinfo`;

CREATE TABLE `specialinfo` (
  `specialID` INTEGER NOT NULL AUTO_INCREMENT, 
  `description` VARCHAR(255), 
  `img` VARCHAR(50), 
  `text` VARCHAR(255), 
  `page` VARCHAR(50), 
  `source` VARCHAR(50), 
  INDEX (`specialID`), 
  PRIMARY KEY (`specialID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'specialinfo'
#

INSERT INTO `specialinfo` (`specialID`, `description`, `img`, `text`, `page`, `source`) VALUES (797, 'Glaser family and the civil war', NULL, 'At that time the country was torn by the Civil War (1861-1865) in which nearly half a million American soldiers lost their lives, more than in the second World War! The three youngest, American-born sons had followed Lincoln''s call to volunteer…', 'glasersCivilwar.htm', 'Sheila Glaser Bultmann''s paper');
INSERT INTO `specialinfo` (`specialID`, `description`, `img`, `text`, `page`, `source`) VALUES (798, 'Frank Glaser''s Strykersville Brewery', NULL, 'The most disastrous fire this village has ever known occurred on Fri. afternoon, Aug 13, 1909. The large brewery with Hotel attached, owned by Frank Glaser…', 'frankGlaserBrewery.htm', 'Compiled by Mary Ann Metzger');
INSERT INTO `specialinfo` (`specialID`, `description`, `img`, `text`, `page`, `source`) VALUES (799, 'Peter Reisdorf''s Mill', NULL, 'The Reisdorfs operated a saw mill, grist mill, cider mill and the cooper shop, where he made barrels. The waterfall on the creek provided power to operate the mill and several hired men and later family members labored in the mills and farm operation…', 'PeterReisdorfMill.htm', 'Compiled by Mary Ann Metzger');
INSERT INTO `specialinfo` (`specialID`, `description`, `img`, `text`, `page`, `source`) VALUES (800, 'John Keem''s Obituary', NULL, 'John Keem, a well known and nearly life long resident of Wales, died at his home in that town on Wednesday, January 30, after a lingering illness at the age of 84 years…', 'JohnKeemObit.htm', NULL);
INSERT INTO `specialinfo` (`specialID`, `description`, `img`, `text`, `page`, `source`) VALUES (801, 'Mary Reisdorf''s Obituary', NULL, 'We are pained to announce the death of Mrs. Mary Glaser, wife of Peter Reisdorf, which occurred at her late home in Strykersville, N.Y., April 20th 1890, at the age of 59 years 11 months, 13 days, of stomach difficulty…', 'MaryReisdorfObit.htm', NULL);
INSERT INTO `specialinfo` (`specialID`, `description`, `img`, `text`, `page`, `source`) VALUES (802, 'Emily Tusk''s Obituary', NULL, 'Mrs. Emily Tusk, one of Sheldon''s most remarkable women passed away at the home of her son Albert Smith at Wales Center Sunday afternoon at 2 o''clock, March 3rd after a week''s illness of influenza followed by pneumonia...', 'EmilyTuskObit.htm', NULL);
INSERT INTO `specialinfo` (`specialID`, `description`, `img`, `text`, `page`, `source`) VALUES (803, 'Frank Glaser''s Civil War Soldier Record', NULL, 'Name: Frank Gleaser<br/>Enlistment Date: 11 August 1862  <br/>Distinguished Service: DISTINGUISHED SERVICE <br/>…', 'FrankGlaserSoldier.htm', 'Mary Ann Metzger');
# 7 records

#
# Table structure for table 'specialinfoPerson'
#

DROP TABLE IF EXISTS `specialinfoPerson`;

CREATE TABLE `specialinfoPerson` (
  `specialgroupID` INTEGER NOT NULL AUTO_INCREMENT, 
  `infoID` INTEGER DEFAULT 0, 
  `type` INTEGER DEFAULT 0, 
  `subjectID` INTEGER DEFAULT 0, 
  INDEX (`infoID`), 
  PRIMARY KEY (`specialgroupID`), 
  INDEX (`specialgroupID`), 
  INDEX (`subjectID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'specialinfoPerson'
#

INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (1, 797, 1, 697);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (2, 797, 1, 700);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (3, 797, 1, 702);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (4, 797, 1, 269);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (5, 797, 1, 268);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (6, 797, 1, 811);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (7, 797, 1, 813);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (8, 797, 2, 195);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (9, 797, 2, 80);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (10, 798, 1, 811);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (11, 799, 1, 250);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (12, 799, 1, 811);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (13, 799, 1, 251);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (14, 799, 2, 78);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (15, 799, 1, 256);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (16, 801, 1, 251);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (17, 800, 1, 240);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (18, 802, 1, 272);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (19, 802, 1, 273);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (20, 802, 1, 282);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (21, 802, 1, 274);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (22, 802, 1, 275);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (23, 802, 1, 276);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (24, 802, 1, 277);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (25, 802, 1, 278);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (26, 802, 1, 279);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (27, 802, 1, 280);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (28, 802, 1, 41);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (29, 802, 1, 281);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (30, 800, 2, 76);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (31, 800, 1, 246);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (32, 800, 1, 247);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (33, 800, 1, 248);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (34, 800, 1, 249);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (35, 800, 1, 241);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (36, 800, 1, 242);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (37, 800, 1, 51);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (38, 800, 1, 245);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (39, 800, 1, 239);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (40, 800, 1, 243);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (41, 800, 1, 244);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (42, 801, 1, 250);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (43, 801, 1, 253);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (44, 801, 1, 270);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (45, 803, 1, 811);
INSERT INTO `specialinfoPerson` (`specialgroupID`, `infoID`, `type`, `subjectID`) VALUES (46, 797, 1, 812);
# 46 records

#