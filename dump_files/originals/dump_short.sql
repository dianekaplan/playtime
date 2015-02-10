#
# DUMP FILE
#
# Database is ported from MS Access
#------------------------------------------------------------------
# Created using "MS Access to MySQL" form http://www.bullzip.com
# Program Version 5.2.252
#
# OPTIONS:
#   sourcefilename=C:\Users\Diane\Desktop\test.mdb
#   sourceusername=
#   sourcepassword=
#   sourcesystemdatabase=
#   destinationdatabase=second_test
#   storageengine=MyISAM
#   dropdatabase=0
#   createtables=1
#   unicode=1
#   autocommit=1
#   transferdefaultvalues=1
#   transferindexes=1
#   transferautonumbers=1
#   transferrecords=1
#   columnlist=1
#   tableprefix=
#   negativeboolean=0
#   ignorelargeblobs=0
#   memotype=LONGTEXT
#

CREATE DATABASE IF NOT EXISTS `second_test`;
USE `second_test`;

#
# Table structure for table 'families'
#

DROP TABLE IF EXISTS `families`;

CREATE TABLE `families` (
  `familyID` INTEGER NOT NULL AUTO_INCREMENT, 
  `caption` VARCHAR(50), 
  `motherID` INTEGER DEFAULT 0, 
  `fatherID` INTEGER DEFAULT 0, 
  `divorced` TINYINT(1) DEFAULT 0, 
  `marriageDate` VARCHAR(50), 
  `Notes1` VARCHAR(255), 
  `Notes2` VARCHAR(255), 
  `originalBool` TINYINT(1) DEFAULT 0, 
  `noKidsBool` TINYINT(1) DEFAULT 0, 
  `sequence` INTEGER DEFAULT 0, 
  `Branch` INTEGER DEFAULT 0, 
  `Branchseq` VARCHAR(5), 
  `KeemBool` TINYINT(1) DEFAULT 0, 
  `HusbandBool` TINYINT(1) DEFAULT 0, 
  `KemlerBool` TINYINT(1) DEFAULT 0, 
  `KaplanBool` TINYINT(1) DEFAULT 0, 
  `showOnBranchViewBool` TINYINT(1) DEFAULT 0, 
  `flag1` VARCHAR(255), 
  `flag2` VARCHAR(255), 
  `lastModified` DATETIME, 
  INDEX (`familyID`), 
  INDEX (`fatherID`), 
  INDEX (`motherID`), 
  PRIMARY KEY (`familyID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'families'
#

INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (45, 'The Margulis family (Philip & Bertha)', 151, 150, 0, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (46, 'The Margulis family (Philip & Rebecca)', 152, 150, 0, NULL, 'Philip and Rebecca lived in Stamford, CT', NULL, 0, 1, 2, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (47, 'The Levines (Harry & Sylvia)', 153, 155, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (48, 'The Bartletts (Joe & Barbara)', 157, 156, 0, '2/16/1946', NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (49, 'The Bartletts (John & Janet)', 160, 159, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (50, 'The O\'Briens (Andrea & Willie)', 89, 162, 0, NULL, NULL, NULL, 0, 0, 0, 4, '15', 0, 0, 0, 1, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (53, 'The Nitkins (Etta & Sam)', 14, 169, 0, NULL, NULL, NULL, 0, 0, 0, 3, '12', 0, 0, 1, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (55, 'The Kaplans (Hymie & Eva)', 176, 13, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (56, 'The Franks (Leonard & Selma)', 178, 174, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (57, 'The Brunswicks (Ann\'s family)', 179, 180, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (58, 'The Husbands (James & Tess)', 181, 76, 1, NULL, 'James and Tess met in their twenties at a party. They raised their family in Buffalo and divorced many years ago.', NULL, 0, 0, 0, 2, '13', 0, 1, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (59, 'The Klopers (Mildred & Irving)', 185, 186, 0, '9/01/1941', NULL, NULL, 0, 0, 0, 4, '14', 0, 0, 0, 1, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (60, 'Debbie Feinberg & ?', 125, 190, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (61, 'Jill Feinberg & ?', 126, 193, 0, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (62, 'The Fitzpatricks (William & Sarah)', 200, 201, 0, NULL, 'Married in 1860. According to the following source, they shared a duplex with Jeremiah and Catherine Fitzpatrick: http://familytreemaker.genealogy.com/users/f/i/t/W-Daniel-Fitzpatrick/WEBSITE-0001/UHP-0396.html', 'The family lived in Buffalo, NY. In 1880, Sarah\'s mother Jane O\'Brien was living with them, and after Grace\'s daughter Sadie was born in 1885 she lived with them too. According to the 1869 Buffalo city directory, they lived at 499 Spring Street', 0, 0, 0, 2, '10', 0, 1, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (63, 'The Bergers (Ed\'s parents)', 204, 203, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (64, 'The Weeks (Rachel & Art)', 133, 202, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (65, 'The Silvermans (Judy & David)', 205, 206, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (66, 'The Silvermans (Robert & Joanna)', 210, 207, 0, NULL, NULL, NULL, 0, 1, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (67, 'The Silvermans (Steven & Susan)', 211, 208, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (68, 'The Silvermans (Gary & Helane)', 214, 209, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (69, 'The Ansuinis (Catherine & Thomas)', 70, 216, 0, NULL, NULL, NULL, 0, 0, 0, 1, '14', 1, 0, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (70, 'The Dolphs (Mary & Eddie)', 219, 220, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (71, 'The Tennens (Arthur & Mildred)', 222, 223, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (72, 'The Goodmans (Cecile & Tunny)', 177, 226, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (73, 'The Scudieros (Anita & Anthony)', 72, 227, 1, NULL, NULL, NULL, 0, 0, 0, 1, '14', 1, 0, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (74, 'The Klyzas (Maria & Jim)', 69, 228, 0, NULL, NULL, NULL, 0, 0, 0, 1, '14', 1, 0, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (75, 'The Gorrusos (Tony & Frankie)', 232, 71, 0, NULL, NULL, NULL, 0, 0, 0, 1, '14', 1, 0, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (76, 'The Keems (Martin & Catherine)', 238, 237, 0, '9/21/1835', 'Catherine & Martin came from Alsace. Catherine wouldn\'t marry until she came to the US and see if she liked it, she came with a brother ', 'Married: 1835 in St. Louis RC Church, Buffalo, Erie, NY\r\n\t\t          \t\t \t ', 0, 0, 0, 1, '9', 1, 0, 0, 0, 1, NULL, NULL, '2011-03-13 11:31:41');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (77, 'The Keems (John & ?)', 246, 240, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (78, 'The Reisdorfs (Peter & Mary)', 251, 250, 0, '1/21/1847', 'married in St.\r\nMary\'s in Buffalo\r\n\t\t          \t\t \t ', 'The 1850 census (from August of that year) has one child: Anna M, 1 year old\t ', 0, 0, 0, 1, '10', 1, 0, 0, 0, 1, NULL, NULL, '2010-08-08 09:09:58');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (79, 'The Reisdorfs (Ed & ?)', 264, 263, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (80, 'The Glasers (Franz & Anna)', 268, 269, 0, '2/06/1822', 'married in Mettenich, Luxembourg, Belgium.  They emigrated in 1834 with seven Eiweiler-born children, and had 6 more in America\r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t ', '\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t ', 1, 0, 0, 1, '09', 1, 0, 0, 0, 1, NULL, NULL, '2010-10-18 21:30:29');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (81, 'The Smiths (John & Emily)', 272, 273, 0, '9/07/1852', 'married in St. Cecilia RC Church, Sheldon, NY', NULL, 0, 0, 1, 1, '10', 1, 0, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (82, 'The Tusks (Dominick & Emily)', 272, 282, 0, '5/17/1893', 'married in Sheldon, NY', NULL, 0, 1, 2, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (83, 'The Reisdorfs (Johann & Elizabeth)', 284, 283, 0, NULL, NULL, NULL, 0, 0, 0, 1, '09', 1, 0, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (84, 'The Schultzs (Arnold & Stephanie)', 288, 196, 0, NULL, 'anniversary: 12/20', NULL, 0, 0, 0, 0, '15', 0, 0, 0, 1, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (85, 'The Dehlingers (John & Anna)', 260, 292, 0, NULL, 'They were married in 1892', NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (86, 'The Husbands (Andrew & Mary)', 294, 293, 0, '', 'Family was raised in Chautauqua, NY \t          ', '\t\t          \t\t \t ', 0, 0, 0, 2, '11', 0, 1, 0, 0, 1, NULL, NULL, '2010-11-11 11:47:20');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (87, 'Susan & Mike', 81, 296, 0, '', 'Susan and Mike were married in Boston on November 12, 2005\r\n\t\t          \t\t \t ', 'They love travelling, enjoying music together, and going to see the Red Sox\r\n\t\t          \t\t \t ', 0, 1, 2, 0, '', 1, 1, 0, 0, 0, NULL, NULL, '2011-01-29 11:39:31');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (88, 'The Smiths (Frank & Julia)', 298, 279, 0, '10/17/1893', 'married in St. Cecilia RC Church, Sheldon, NY', NULL, 0, 0, 0, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (89, 'The Suttles (Jacob & Rosa)', 305, 304, 0, '', 'ancestry has 13 kids in all:<br/> Elizabeth (1848), Amos (1849), Jacob James (1852), Catherine (1852), Joseph (1854), Caroline (1856), Mary (1856), John S (11/15/1859), Edward (1859), George (1862), John (1866), Julia (1867), Charles (1870)\r\n\t\t          \t', '\t\t          \t\t \t ', 1, 0, 0, 1, '10', 1, 0, 0, 0, 1, NULL, NULL, '2010-08-01 10:30:29');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (90, 'The Kobrins (Aaron & Rochel)', 311, 310, 0, NULL, 'Annie + Rebecca Shapiro (sisters) married Kalman and Solomon Kobrin (brothers)', NULL, 1, 0, 0, 4, '11', 0, 0, 0, 1, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (91, 'The Schultz\'s (Jeff & Miriam)', 318, 94, 0, NULL, 'married: 5/20/1976', NULL, 0, 0, 1, 0, '15', 0, 0, 0, 1, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (92, 'The Kobrins (Nathan & Esther)', 319, 312, 0, NULL, 'They married when Natahn was 18 and Esther was 17', 'Noah and Minnie came to the US, the other three brothers were in South Africa', 0, 0, 0, 4, '12', 0, 0, 0, 1, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (93, 'The Slonimskys (Barney & Annie)', 313, 324, 0, NULL, NULL, NULL, 0, 0, 0, 4, '12', 0, 0, 0, 1, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (94, 'The Blochs (Chaim & Yetta)', 314, 330, 0, NULL, 'They were married in Johannesburg, South Africa in 1905', NULL, 0, 0, 0, 4, '12', 0, 0, 0, 1, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (95, 'The Kobrins (Solomon & Rebecca)', 336, 316, 0, NULL, NULL, NULL, 0, 0, 0, 4, '12', 0, 0, 0, 1, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (96, 'The Kobrins (Noah & Hilda)', 341, 320, 0, '1/02/1934', 'We came to the US in March 23, 1939  and remained in New York until 1950.  Dad was a buyer for the family retail womens & childrens department stores in Johannesburg. The family also had a dress factory which is still in operation...\r\n\t\t          \t\t \t ', '...copying American styles & sold in their department stores.\r\nI returned to Johannesburg with my parents Hilda & Noah,  in 1950, after the devaluation of the Britich Pound.  We lived on west 77st across the street from the Museum of Natural History.\r\n\t\t ', 0, 0, 0, 4, '13', 0, 0, 0, 1, 1, NULL, NULL, '2010-09-08 22:58:51');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (32, 'The Kemlers (Robert & Kathy)', 127, 115, 0, NULL, NULL, NULL, 0, 0, NULL, 3, '14', 0, 0, 1, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (33, 'The Kemlers (Irving & Evelyn)', 130, 26, 0, NULL, NULL, NULL, 0, 1, NULL, 3, '13', 0, 0, 1, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (34, 'The Kemlers (Stanley & Linda)', 131, 23, 1, NULL, NULL, NULL, 0, 1, 2, NULL, NULL, 0, 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (36, 'The Kemlers (Stanley & Elaine)', 117, 23, 0, NULL, NULL, NULL, 0, 1, 3, 3, '13', 0, 0, 1, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (37, 'The Bergers (Ed & Susan)', 132, 110, 1, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (38, 'The Zorns (Joe & Pat)', 9, 8, 0, NULL, NULL, NULL, 0, 0, 0, 3, '14', 0, 0, 1, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (39, 'The Zorns (Stuart & Elaine)', 7, 6, 0, '12/22/1968', '\t\t          \t\t \t ', '\t\t          \t\t \t ', 0, 0, 0, 3, '14', 0, 0, 1, 0, 1, NULL, NULL, '2010-08-22 21:19:09');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (40, 'The Sheehes (Helen & Jim)', 59, 102, 0, NULL, NULL, NULL, 0, 1, 0, 1, '13', 1, 0, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (41, 'The Dwyers (Tom & Janet)', 64, 134, 0, NULL, NULL, NULL, 0, 0, 0, 1, '14', 1, 0, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (42, 'Patty & Doug', 66, 135, 1, '', '\t\t          \t\t \t \r\n\t\t          \t\t \t ', '\t\t          \t\t \t \r\n\t\t          \t\t \t ', 0, 1, 0, 1, '14', 1, 0, 0, 0, 0, NULL, NULL, '2010-09-21 23:23:41');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (43, 'The Husbands (Tom/Ward & Izzy)', 146, 78, 0, '8/19/1943', '\t\t          \t\t \t ', '\t\t          \t\t \t ', 0, 1, 0, 2, '13', 0, 1, 0, 0, 1, NULL, NULL, '2011-04-23 08:41:06');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (44, 'The Husbands (Don & Evelyn)', 147, 77, 0, NULL, NULL, NULL, 0, 0, 0, 2, '13', 0, 1, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (97, 'The Kobrins (Sam & Anne)', 345, 321, 0, '', '\t\t          \t\t \t ', '\t\t          \t\t \t ', 0, 0, 0, 4, '13', 0, 0, 0, 1, 1, NULL, NULL, '2010-09-19 09:58:23');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (98, 'The Kobrins (Naphthali & Polly)', 349, 322, 0, '', 'they were married in 1941\r\n\t\t          \t\t \t ', '\t\t          \t\t \t ', 0, 0, 0, 4, '13', 0, 0, 0, 1, 1, NULL, NULL, '2011-05-19 07:23:48');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (99, 'The Kobrins (Kal & Marilyn)', 354, 92, 0, '10/07/1990', 'They were married in Medford, MA', NULL, 0, 1, 0, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (100, 'The Owens\' (Judy & Peter)', 189, 355, 0, '5/25/1979', 'They were married in Natick, MA', NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (101, 'The Lie-Kwies (Karen & Tjien-Wan Eddy)', 99, 361, 0, NULL, 'married 5/29/1971 in Honolulu, Hawaii', 'divorced in June, 1983', 0, 0, 1, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (102, 'The Cohens (Karen & Matthew)', 99, 362, 0, '7/03/1983', 'married in Honolulu, Hawaii\r\n\t\t          \t\t \t \r\n\t\t          \t\t \t ', '\t\t          \t\t \t \r\n\t\t          \t\t \t ', 0, 0, 2, 4, '15', 0, 0, 0, 1, 1, NULL, NULL, '2010-07-26 22:48:04');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (103, 'The Farrells (Teleia and Brian)', 363, 365, 0, '9/15/2001', 'married in Lincoln, MA', NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (104, 'The Schmeids (Stephen & Ana Maria)', 368, 367, 0, NULL, NULL, NULL, 1, 0, 0, 1, '09', 1, 0, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (105, 'The Suttells (Frank & Gertrude)', 373, 45, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (106, 'The Suttells (Ed & Martha)', 376, 46, 0, '9/12/1907', 'married in St. Cecilia RC Church, Sheldon, NY', 'In the 1930 census they were in Williamston, Ingham, Michigan, with children Raymond J, Bernadetta M, Agnes E, Lawrence L M, and Angelia', 0, 0, 0, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (107, 'The Pochels (Edward & Catherine)', 381, 380, 0, NULL, 'The pochels moved to this country from France in 1833', NULL, 1, 0, 0, 1, '09', 1, 0, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (108, 'The Keems (Martin & Barbara)', 388, 387, 0, '', 'ORPHANED DATA FROM MARTIN KEEM NAME CONFLICT    \t\t \t \r\n\t\t          \t\t \t ', '\t\t          \t\t \t \r\n\t\t          \t\t \t ', 0, 0, 0, 1, '09', 1, 0, 0, 0, 0, NULL, NULL, '2012-06-19 22:12:03');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (109, 'The Kornprobsts (Jacob & Catherine)', 391, 390, 0, NULL, 'married around 1775, Schoenenbourg,67250,Bas-Rhin,Alsace,FRANCE', 'http://www.ott.fr/public/toutes/ged2web/people/p000086g.htm#I47880 has children Jacques and Marie-Francoise instead', 0, 0, 0, 1, '09', 1, 0, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (110, 'The Husbands (Kevin & Carol)', 396, 182, 1, NULL, 'Kevin and Carol have divorced', NULL, 0, 0, 0, 2, '14', 0, 1, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (111, 'The Adams\' (Carl & Caren)', 183, 399, 1, NULL, 'Carl and Caren started their family in Hawaii- they have since divorced, and now Caren and the children are living with Tess', NULL, 0, 0, 0, 2, '14', 0, 1, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (112, 'The Lynetts (Mark & Kate)', 184, 403, 1, NULL, 'Mark and Kate have divorced', NULL, 0, 0, 0, 2, '14', 0, 1, 0, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (113, 'The Kobrins (Joe & Edith)', 408, 315, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (114, 'The Sneags (Beila & Sam)', 317, 409, 0, NULL, NULL, NULL, 0, 0, 0, 4, '12', 0, 0, 0, 1, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (115, 'The Keems (Augustus & Ella)', 410, 245, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (116, 'The Nitkins (Sonny & Dianne)', 419, 171, 0, NULL, NULL, NULL, 0, 0, 0, 3, '13', 0, 0, 1, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (117, 'The Nitkins (David & Karen)', 422, 420, 0, '1/08/1994', NULL, NULL, 0, 0, 0, 3, '14', 0, 0, 1, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (118, 'The Doughertys (David & Deborah)', 421, 425, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (119, 'The Shapiros (Max & Toba)', 430, 429, 0, NULL, 'There is some uncertainty whether this family name was Shapiro or Davis (Joe and Larry Kaplan had different memories about their mother\'s maiden name).', 'Toba & Max Shapiro moved from Russia to Johannesburg, South Africa.  Annie + Rebecca Shapiro (sisters) married Kalman and Solomon Kobrin (brothers)', 0, 0, 0, 4, '11', 0, 0, 0, 1, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (120, 'The Davis\' (Tevya & Rebecca)', 433, 431, 0, NULL, 'There is some uncertainty whether this family name was Shapiro or Davis (Joe and Larry Kaplan had different memories about their mother\'s maiden name)', NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (121, 'The Sklars (Polly & ?)', 432, 441, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (122, 'The Svikharts (Ed & Joann)', 453, 452, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (123, 'The Nitkins (Nathaniel & Lena)', 454, 455, 0, '', 'Other children in 1920 census: Freda (1902), Celia (1906), Reuben (1915) \t ', '\t\t          \t\t \t ', 0, 0, 0, 0, '', 0, 0, 1, 0, 0, NULL, NULL, '2010-08-04 08:09:33');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (124, 'The Nitkins (Jack & Anna)', 456, 172, 0, NULL, NULL, NULL, 0, 1, 0, 0, NULL, 0, 0, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (125, 'The Klapmans (Charles & Judy)', 173, 457, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (126, 'The Kobrins (Joe & Kathleen)', 461, 337, 0, NULL, 'married: 24 Dec 1931 in Pietermaritzburg, Natal, South Africa', NULL, 0, 0, 1, 4, '13', 0, 0, 0, 1, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (127, 'The Kobrins (David & Sharon)', 463, 462, 0, NULL, 'married: 22 May 1971 in Pietermaritzburg, Natal, South Africa', NULL, 0, 0, 0, 4, '14', 0, 0, 0, 1, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (128, 'The Kobrins (Mannie & Zelda)', 468, 340, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (129, 'The Kobrins (Joe & Tracy)', 471, 464, 0, NULL, 'married: 25 Apr 1998 in Newcastle, South Africa', NULL, 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (30, 'The Kemlers (Barry & Joan)', 118, 107, 0, NULL, NULL, NULL, 0, 0, NULL, 3, '14', 0, 0, 1, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (31, 'The Kemlers (Stanley & Mary)', 121, 23, 1, NULL, ' ', ' ', 0, 0, 1, 3, '13', 0, 0, 1, 0, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (130, 'The Robertsons (Alan & Joan)', 475, 476, 0, NULL, 'married: 18 Dec 1957 in Pietermaritzburg, Natal, South Africa', 'lived in Zimbabwe, had children: Penelope, Vanessa, Darryl', 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (131, 'The Kobrins (Balfour & Margery)', 477, 474, 0, NULL, 'married: 18 Jul 1959 in Durban', 'have children: Lynette, Yvonne, Michael, Stephen', 0, 0, 0, 0, NULL, 0, 0, 0, 1, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (132, 'The Kims (Laurent & Barbe)', 491, 490, 0, '', '\t\t          \t\t \t \r\n\t\t          \t\t \t ', '\t\t          \t\t \t \r\n\t\t          \t\t \t ', 1, 0, 0, 1, '08', 1, 0, 0, 0, 1, NULL, NULL, '2012-01-26 21:33:54');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (133, 'The Wolffs (Nicholas & Maria)', 489, 488, 0, '11/17/1738', 'Married 17 NOV 1738, Kutzenhausen,67250,Bas-Rhin,Alsace,FRANCE', NULL, 0, 0, 0, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (134, 'The Kornprobsts (Jean Michel & Marie Eve)', 486, 485, 0, NULL, 'Jean-Michel Kornprobst & Marie Éve Stupffler were married in 1740', NULL, 0, 0, 0, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (135, 'The Kims (Jean & Madeleine)', 497, 496, 0, '1/05/1781', '\t\t          \t\t \t \r\n\t\t          \t\t \t ', '\t\t          \t\t \t \r\n\t\t          \t\t \t ', 0, 0, 0, 1, '07', 1, 0, 0, 0, 1, NULL, NULL, '2011-03-06 08:25:44');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (136, 'The Goldbergs (Trevor & Linda)', 344, 498, 0, '6/30/1974', 'married in Johannesburg June 30th 1974 and emigrated to the USA June 10th 1977', NULL, 0, 0, 0, 4, '14', 0, 0, 0, 1, 1, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (137, 'The Rothschilds (Ray & Evelyn)', 342, 501, 0, '8/22/1954', '\t\t          \t\t \t \r\n\t\t          \t\t \t ', '\t\t          \t\t \t \r\n\t\t          \t\t \t ', 0, 0, 0, 4, '14', 0, 0, 0, 1, 1, NULL, NULL, '2011-05-19 07:20:30');
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (138, 'The Kornprobsts (Jean & Anne-Marie)', 507, 506, 0, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `families` (`familyID`, `caption`, `motherID`, `fatherID`, `divorced`, `marriageDate`, `Notes1`, `Notes2`, `originalBool`, `noKidsBool`, `sequence`, `Branch`, `Branchseq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `showOnBranchViewBool`, `flag1`, `flag2`, `lastModified`) VALUES (139, 'The Pochels (Frederick and Catharine)', 509, 384, 0, '4/16/1860', 'Married on April 16 1860 in St. Cecilia RC Church, Sheldon, NY', NULL, 0, 0, 0, 0, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL);
#
# Table structure for table 'imagePerson'
#

DROP TABLE IF EXISTS `imagePerson`;

CREATE TABLE `imagePerson` (
  `imageGroupID` INTEGER NOT NULL AUTO_INCREMENT, 
  `imageID` INTEGER DEFAULT 0, 
  `personID` INTEGER DEFAULT 0, 
  INDEX (`imageGroupID`), 
  INDEX (`imageID`), 
  INDEX (`personID`), 
  PRIMARY KEY (`imageGroupID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'imagePerson'
#

INSERT INTO `imagePerson` (`imageGroupID`, `imageID`, `personID`) VALUES (481, 366, 27);
INSERT INTO `imagePerson` (`imageGroupID`, `imageID`, `personID`) VALUES (482, 366, 26);
INSERT INTO `imagePerson` (`imageGroupID`, `imageID`, `personID`) VALUES (483, 367, 27);
INSERT INTO `imagePerson` (`imageGroupID`, `imageID`, `personID`) VALUES (484, 367, 26);
INSERT INTO `imagePerson` (`imageGroupID`, `imageID`, `personID`) VALUES (485, 367, 25);

# 1050 records

#
# Table structure for table 'images'
#

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `imageID` INTEGER NOT NULL AUTO_INCREMENT, 
  `bigName` VARCHAR(50), 
  `stdName` VARCHAR(50), 
  `littleName` VARCHAR(50), 
  `caption` VARCHAR(50), 
  `subject` INTEGER DEFAULT 0, 
  `featureBool` TINYINT(1) DEFAULT 0, 
  `Year` VARCHAR(25), 
  `family` INTEGER DEFAULT 0, 
  INDEX (`imageID`), 
  PRIMARY KEY (`imageID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'images'
#

INSERT INTO `images` (`imageID`, `bigName`, `stdName`, `littleName`, `caption`, `subject`, `featureBool`, `Year`, `family`) VALUES (489, '2006gus.jpg', NULL, 'T2006gus.jpg', NULL, 111, 0, '2006', 0);
INSERT INTO `images` (`imageID`, `bigName`, `stdName`, `littleName`, `caption`, `subject`, `featureBool`, `Year`, `family`) VALUES (490, '2006 rachel.jpg', 'M2006 rachel.jpg', 'T2006 rachel.jpg', NULL, 133, 1, '2006', 0);
INSERT INTO `images` (`imageID`, `bigName`, `stdName`, `littleName`, `caption`, `subject`, `featureBool`, `Year`, `family`) VALUES (491, '2006 bergers.jpg', NULL, 'T2006 bergers.jpg', NULL, 0, 0, '2006', 0);
INSERT INTO `images` (`imageID`, `bigName`, `stdName`, `littleName`, `caption`, `subject`, `featureBool`, `Year`, `family`) VALUES (500, 'Karen & David 2006.jpg', NULL, 'TKaren & David 2006.jpg', NULL, 0, 0, '2006', 0);
INSERT INTO `images` (`imageID`, `bigName`, `stdName`, `littleName`, `caption`, `subject`, `featureBool`, `Year`, `family`) VALUES (501, 'lena and nathaniel nitkin.jpg', NULL, 'Tlena and nathaniel nitkin.jpg', NULL, 0, 0, NULL, 0);

#
# Table structure for table 'Notes'
#

DROP TABLE IF EXISTS `Notes`;

CREATE TABLE `Notes` (
  `noteID` INTEGER NOT NULL AUTO_INCREMENT, 
  `refID` INTEGER DEFAULT 0, 
  `Type` INTEGER DEFAULT 0, 
  `fromPerson` INTEGER DEFAULT 0, 
  `body` LONGTEXT, 
  `fromName` VARCHAR(50), 
  `date` DATETIME, 
  `ActiveBool` TINYINT(1) DEFAULT 0, 
  INDEX (`Type`), 
  INDEX (`noteID`), 
  INDEX (`refID`), 
  PRIMARY KEY (`noteID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Notes'
#

INSERT INTO `Notes` (`noteID`, `refID`, `Type`, `fromPerson`, `body`, `fromName`, `date`, `ActiveBool`) VALUES (59, 81, 1, 79, 'This is my fabulous sister whom I love & admire so much.  I adored her as a child and still do as an adult.  I love you Susie!\t\t          \t\t \t ', 'Deborah Bartlett', '2010-03-14 16:06:52', 1);
INSERT INTO `Notes` (`noteID`, `refID`, `Type`, `fromPerson`, `body`, `fromName`, `date`, `ActiveBool`) VALUES (61, 85, 1, 79, 'I have so many memories of Larry, as a baby, boy and now as an adult.  Larry is the kindest person I know, always there with a laugh and love for those around him.\t\t          \t\t \t ', 'Deborah Bartlett', '2010-03-14 16:11:58', 1);
INSERT INTO `Notes` (`noteID`, `refID`, `Type`, `fromPerson`, `body`, `fromName`, `date`, `ActiveBool`) VALUES (62, 86, 1, 79, 'Diane is my favorite (and only) girl in our family.  We are blessed to have her in our family.  She brings a strong woman\'s point of view to our lives. She is adventurous and loves life.\t\t          \t\t \t ', 'Deborah Bartlett', '2010-03-14 16:13:56', 1);

#
# Table structure for table 'people'
#

DROP TABLE IF EXISTS `people`;

CREATE TABLE `people` (
  `personID` INTEGER NOT NULL AUTO_INCREMENT, 
  `first` VARCHAR(15), 
  `middle` VARCHAR(15), 
  `last` VARCHAR(15), 
  `maiden` VARCHAR(15), 
  `nickname` VARCHAR(15), 
  `face` VARCHAR(50), 
  `siblingSeq` INTEGER DEFAULT 0, 
  `KeemBool` TINYINT(1) DEFAULT 0, 
  `HusbandBool` TINYINT(1) DEFAULT 0, 
  `KemlerBool` TINYINT(1) DEFAULT 0, 
  `KaplanBool` TINYINT(1) DEFAULT 0, 
  `interests` VARCHAR(255), 
  `education` VARCHAR(250), 
  `work` VARCHAR(255), 
  `notes1` VARCHAR(255), 
  `notes2` VARCHAR(255), 
  `notes3` VARCHAR(255), 
  `birthdate` VARCHAR(15), 
  `birthplace` VARCHAR(100), 
  `deathdate` VARCHAR(15), 
  `Gender` VARCHAR(1), 
  `origin` VARCHAR(85), 
  `firstFamily` INTEGER DEFAULT 0, 
  `currentLocation` VARCHAR(50), 
  `adoptedBool` TINYINT(1) DEFAULT 0, 
  `directBool` TINYINT(1) DEFAULT 0, 
  `hideBool` TINYINT(1) DEFAULT 0, 
  `lastModified` DATETIME, 
  `flag1` VARCHAR(255), 
  `flag2` VARCHAR(255), 
  INDEX (`personID`), 
  PRIMARY KEY (`personID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'people'
#


INSERT INTO `people` (`personID`, `first`, `middle`, `last`, `maiden`, `nickname`, `face`, `siblingSeq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `interests`, `education`, `work`, `notes1`, `notes2`, `notes3`, `birthdate`, `birthplace`, `deathdate`, `Gender`, `origin`, `firstFamily`, `currentLocation`, `adoptedBool`, `directBool`, `hideBool`, `lastModified`, `flag1`, `flag2`) VALUES (36, 'Kenneth', 'Herbert', 'Kaplan', NULL, '', '36dad.jpg', NULL, 0, 0, 1, 1, 'Biking, travelling, yoga, meditation\r\n\t\t          \t\t \t \r\n\t\t          \t\t \t ', 'University of Vermont, University of Zurich: MD\r\n\t\t          \t\t \t \r\n\t\t          \t\t \t ', 'Physician\r\n\t\t          \t\t \t \r\n\t\t          \t\t \t ', '\r\n\t\t          \t\t \t ', '\t\t          \t\t \t \r\n\t\t          \t\t \t ', NULL, '3/17/1940', 'Boston, MA', NULL, 'M', 'Lithuanian (3/4) and Ukranian (1/4)', 7, 'Weston, MA', 0, 0, 0, '2010-07-15 08:37:31', 'us', NULL);
INSERT INTO `people` (`personID`, `first`, `middle`, `last`, `maiden`, `nickname`, `face`, `siblingSeq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `interests`, `education`, `work`, `notes1`, `notes2`, `notes3`, `birthdate`, `birthplace`, `deathdate`, `Gender`, `origin`, `firstFamily`, `currentLocation`, `adoptedBool`, `directBool`, `hideBool`, `lastModified`, `flag1`, `flag2`) VALUES (81, 'Susan', 'Carol', 'Kaplan', 'Husband', '', '81mom.jpg', 1, 1, 1, 0, 0, 'Travel, reading, movies, shopping, Red Sox, flower arranging\r\n\t\t          \t\t \t ', 'Russell Sage, Manhattan Marymount College, Boston University: MBA\r\n\t\t          \t\t \t ', 'Financial Advisor- <a href=\"http://www.kaplan-financial.com\" target=\"_blank\">see website</a>\r\n\t\t          \t\t \t ', '\t\t          \t\t \t ', '\t\t          \t\t \t ', NULL, '11/09/1947', 'Buffalo, NY', NULL, 'F', 'French, German, English, Irish, Scottish', 15, 'Newton, MA', 0, 0, 0, '2009-11-25 10:10:57', NULL, NULL);
INSERT INTO `people` (`personID`, `first`, `middle`, `last`, `maiden`, `nickname`, `face`, `siblingSeq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `interests`, `education`, `work`, `notes1`, `notes2`, `notes3`, `birthdate`, `birthplace`, `deathdate`, `Gender`, `origin`, `firstFamily`, `currentLocation`, `adoptedBool`, `directBool`, `hideBool`, `lastModified`, `flag1`, `flag2`) VALUES (85, 'Lawrence', 'David', 'Kaplan', NULL, 'Lawrence', '85larry.jpg', NULL, 1, 1, 1, 1, 'strawberry ice cream, cobras, birch trees, skateboarding… until Larry updates this list  :)\r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t ', 'SUNY Plattsburgh: BA in journalism\r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t ', 'New Media Designer- <a href=\"http://www.lawrencekaplan.com/\" target=\"_blank\">see website</a>\r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t ', '\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t ', '\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t ', NULL, '2/09/1974', 'NYC', NULL, 'M', 'big mix (Lithuanian, Ukranian, French, German, Irish, Scottish, English)', 17, 'Somerville, MA', 0, 0, 0, '2010-07-22 09:10:54', 'us', '');
INSERT INTO `people` (`personID`, `first`, `middle`, `last`, `maiden`, `nickname`, `face`, `siblingSeq`, `KeemBool`, `HusbandBool`, `KemlerBool`, `KaplanBool`, `interests`, `education`, `work`, `notes1`, `notes2`, `notes3`, `birthdate`, `birthplace`, `deathdate`, `Gender`, `origin`, `firstFamily`, `currentLocation`, `adoptedBool`, `directBool`, `hideBool`, `lastModified`, `flag1`, `flag2`) VALUES (86, 'Diane', 'Rachel', 'Kaplan', NULL, '', '86diane.jpg', NULL, 1, 1, 1, 1, 'Dancing, music, playing games + sports, being outdoors\r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t       ', 'Binghamton University: BA in philosophy, University of Rochester: MA in philosophy, Boston University: MS in computer science (in progress)\r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t', 'software testing!  (QA Manager)\r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t', ' \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t ', '\t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t          \t\t \t \r\n\t\t  ', NULL, '9/28/1976', 'Boston, MA', NULL, 'F', 'big mix (Lithuanian, Ukranian, French, German, Irish, Scottish, English)', 17, 'Brighton, MA', 0, 0, 0, '2010-07-22 09:10:38', 'us', '');


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

INSERT INTO `specialinfo` (`specialID`, `description`, `img`, `text`, `page`, `source`) VALUES (797, 'Glaser family and the civil war', NULL, 'At that time the country was torn by the Civil War (1861-1865) in which nearly half a million American soldiers lost their lives, more than in the second World War! The three youngest, American-born sons had followed Lincoln\'s call to volunteer…', 'glasersCivilwar.htm', 'Sheila Glaser Bultmann\'s paper');
INSERT INTO `specialinfo` (`specialID`, `description`, `img`, `text`, `page`, `source`) VALUES (799, 'Peter Reisdorf\'s Mill', NULL, 'The Reisdorfs operated a saw mill, grist mill, cider mill and the cooper shop, where he made barrels. The waterfall on the creek provided power to operate the mill and several hired men and later family members labored in the mills and farm operation…', 'PeterReisdorfMill.htm', 'Compiled by Mary Ann Metzger');

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



# 46 records

#
# Table structure for table 'updates'
#

DROP TABLE IF EXISTS `updates`;

CREATE TABLE `updates` (
  `changeID` INTEGER NOT NULL AUTO_INCREMENT, 
  `userID` INTEGER DEFAULT 0, 
  `personID` INTEGER DEFAULT 0, 
  `familyID` INTEGER DEFAULT 0, 
  `Date` DATETIME, 
  `Moderated` TINYINT(1) DEFAULT 0, 
  `Status` VARCHAR(50), 
  `notes` VARCHAR(200), 
  INDEX (`changeID`), 
  INDEX (`familyID`), 
  INDEX (`personID`), 
  PRIMARY KEY (`changeID`), 
  INDEX (`userID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'updates'
#

INSERT INTO `updates` (`changeID`, `userID`, `personID`, `familyID`, `Date`, `Moderated`, `Status`, `notes`) VALUES (53, 21, 576, 0, '2010-01-06 15:12:47', 1, 'Completed', 'updated middle name');
INSERT INTO `updates` (`changeID`, `userID`, `personID`, `familyID`, `Date`, `Moderated`, `Status`, `notes`) VALUES (913, 1, 0, 195, '2010-10-17 22:13:15', 0, 'Completed', 'Updated marriage from 1797 to 2/07/1797, based on matching trees in ancestry.com');
INSERT INTO `updates` (`changeID`, `userID`, `personID`, `familyID`, `Date`, `Moderated`, `Status`, `notes`) VALUES (914, 1, 0, 195, '2010-10-17 22:13:40', 0, 'Completed', 'Married in Germany, based on matching tree on ancestry.com\r\n\t');



#
# Table structure for table 'users'
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userID` INTEGER NOT NULL AUTO_INCREMENT, 
  `email` VARCHAR(50), 
  `sharedAccount` TINYINT(1) DEFAULT 0, 
  `password` VARCHAR(50) NOT NULL, 
  `lastLogin` DATETIME, 
  `personID` INTEGER DEFAULT 0, 
  `createDate` DATETIME, 
  `lastPestered` DATETIME, 
  `KeemAccess` TINYINT(1) DEFAULT 0, 
  `HusbandAccess` TINYINT(1) DEFAULT 0, 
  `KemlerAccess` TINYINT(1) DEFAULT 0, 
  `KaplanAccess` TINYINT(1) DEFAULT 0, 
  `Logins` INTEGER DEFAULT 0, 
  `ActiveBool` TINYINT(1) DEFAULT 0, 
  `connection_notes` VARCHAR(255), 
  `superAdmin` TINYINT(1) DEFAULT 0, 
  `furthestHTML` VARCHAR(255), 
  INDEX (`personID`), 
  PRIMARY KEY (`userID`), 
  INDEX (`userID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'users'
#


INSERT INTO `users` (`userID`, `email`, `sharedAccount`, `password`, `lastLogin`, `personID`, `createDate`, `lastPestered`, `KeemAccess`, `HusbandAccess`, `KemlerAccess`, `KaplanAccess`, `Logins`, `ActiveBool`, `connection_notes`, `superAdmin`, `furthestHTML`) VALUES (35, 'dianekaplan@gmail.com', 1, 'password1', '2011-02-11 03:06:21', 24, '2010-01-24 00:00:00', NULL, 0, 0, 1, 0, 33, 1, NULL, 0, NULL);
INSERT INTO `users` (`userID`, `email`, `sharedAccount`, `password`, `lastLogin`, `personID`, `createDate`, `lastPestered`, `KeemAccess`, `HusbandAccess`, `KemlerAccess`, `KaplanAccess`, `Logins`, `ActiveBool`, `connection_notes`, `superAdmin`, `furthestHTML`) VALUES (1, 'ok4mee@hotmail.com', 0, 'ilike2go', '2015-01-04 18:47:15', 86, NULL, '2010-10-25 00:00:00', 1, 1, 1, 1, 417, 1, '', 1, '<a href=\"/family/family.asp?familyid=218\">The Zöhlers (Mathias & Maria)</a>\t ');
INSERT INTO `users` (`userID`, `email`, `sharedAccount`, `password`, `lastLogin`, `personID`, `createDate`, `lastPestered`, `KeemAccess`, `HusbandAccess`, `KemlerAccess`, `KaplanAccess`, `Logins`, `ActiveBool`, `connection_notes`, `superAdmin`, `furthestHTML`) VALUES (5, 'bartlett.family@comcast.net', 0, 'password', '2010-07-05 20:05:51', 79, NULL, '2010-10-25 00:00:00', 1, 1, 0, 0, 5, 1, '', 0, '<a href=\"/family/family.asp?familyid=218\">The Zöhlers (Mathias & Maria)</a>');


# 71 records

