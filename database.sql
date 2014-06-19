CREATE TABLE oc_t_building_service_desc (
	fk_service_desc_id INT NOT NULL AUTO_INCREMENT,
	s_service_desc VARCHAR (255),
	s_service_desc_misc VARCHAR (255),

		PRIMARY KEY (fk_service_desc_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET 'UTF8' COLLATE 'UTF8_GENERAL_CI';

CREATE TABLE oc_t_building_term_of_payment (
	fk_term_of_payment_id INT NOT NULL AUTO_INCREMENT,
	s_term_of_payment VARCHAR (255),
	s_term_of_payment_misc VARCHAR (255),

		PRIMARY KEY (fk_term_of_payment_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET 'UTF8' COLLATE 'UTF8_GENERAL_CI';

CREATE TABLE oc_t_item_building_commercial_term (
	fk_i_item_id INT (10) UNSIGNED NOT NULL,
	i_office_typical DECIMAL (18,2) NOT NULL DEFAULT '0.00',
	i_office_mezanine DECIMAL (18,2) NOT NULL DEFAULT '0.00',
	i_office_ground DECIMAL (18,2) NOT NULL DEFAULT '0.00',
	i_service_charge DECIMAL (18,2) NOT NULL DEFAULT '0.00',
	fk_service_desc_id INT (1),
	i_size FLOAT UNSIGNED,
	fk_term_of_payment_id INT (1),
	s_security_deposit VARCHAR (55) NOT NULL DEFAULT '3 MONTHS BASE RENT (Inc. Service Charge)',
	e_lease_term ENUM ('1 YEAR','2 YEARS','3 YEARS'),
	i_electricity DECIMAL (18,2) NOT NULL DEFAULT '0.00',
	i_ac_power DECIMAL (18,2) NOT NULL DEFAULT '0.00',
	i_tel_deposit DECIMAL (18,2) NOT NULL DEFAULT '0.00',
	i_tel_install_cost DECIMAL (18,2) NOT NULL DEFAULT '0.00',
	s_parking_reserved VARCHAR (3) NOT NULL DEFAULT 'TBA',
	s_parking_unreserved VARCHAR (3) NOT NULL DEFAULT 'TBA',
	s_parking_motorcycle VARCHAR (3) NOT NULL DEFAULT 'TBA',
	t_oh_mon_fri_s TIME,
	t_oh_mon_fri_e TIME,
	t_oh_sat_s TIME,
	t_oh_sat_e TIME,
	t_oh_sun_s TIME,
	t_oh_sun_e TIME,
	t_bulding_completion YEAR,
	s_num_of_floors VARCHAR (3) NOT NULL DEFAULT 'TBA',
	s_fs_typical VARCHAR (3) NOT NULL DEFAULT 'TBA',
	s_fs_ground VARCHAR (3) NOT NULL DEFAULT 'TBA',
	s_ch_typical VARCHAR (3) NOT NULL DEFAULT 'TBA',
	s_ch_ground VARCHAR (3) NOT NULL DEFAULT 'TBA',
	st_accessibility SET ('-','TransJakarta','Taxi','City Bus') NOT NULL,
	s_lift_low_zone VARCHAR (3) NOT NULL DEFAULT 'TBA',
	s_lift_high_zone VARCHAR (3) NOT NULL DEFAULT 'TBA',
	s_lift_service VARCHAR (3) NOT NULL DEFAULT 'TBA',
	s_lift_executive VARCHAR (3) NOT NULL DEFAULT 'TBA',
	s_executive_toilet VARCHAR (3) NOT NULL DEFAULT 'TBA',
	st_telecomunication SET ('-','Fiber Optic','Broadband','Leased Line','ISDN') NOT NULL,
	st_fire_safety SET ('-','Springkler','Heat Detector','Smoke Detector','Hydrant') NOT NULL,
	st_facilities SET ('-','BANK/ATM','Restaurant / Cafe','Canteen','Clinic / Dentist') NOT NULL,

		PRIMARY KEY (fk_i_item_id,fk_service_desc_id,fk_term_of_payment_id),
		FOREIGN KEY (fk_i_item_id) REFERENCES oc_t_item (pk_i_id),
		FOREIGN KEY (fk_service_desc_id) REFERENCES oc_t_building_service_desc (fk_service_desc_id),
		FOREIGN KEY (fk_term_of_payment_id) REFERENCES oc_t_building_term_of_payment (fk_term_of_payment_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET 'UTF8' COLLATE 'UTF8_GENERAL_CI';

CREATE TABLE oc_t_item_building_description_attr (
    fk_i_item_id INT UNSIGNED NOT NULL,
    fk_c_locale_code CHAR(5) NOT NULL,
    s_transport VARCHAR(255),
    s_zone VARCHAR(255),

        PRIMARY KEY (fk_i_item_id, fk_c_locale_code),
        FOREIGN KEY (fk_c_locale_code) REFERENCES oc_t_locale (pk_c_code),
        FOREIGN KEY (fk_i_item_id) REFERENCES oc_t_item (pk_i_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET 'UTF8' COLLATE 'UTF8_GENERAL_CI';


CREATE TABLE oc_t_item_building_property_type_attr (
    pk_i_id INT(2) UNSIGNED NOT NULL,
    fk_c_locale_code CHAR(5) NOT NULL,
    s_name VARCHAR(255),
	
        PRIMARY KEY (pk_i_id, fk_c_locale_code),
        FOREIGN KEY (fk_c_locale_code) REFERENCES oc_t_locale (pk_c_code)
) ENGINE=InnoDB DEFAULT CHARACTER SET 'UTF8' COLLATE 'UTF8_GENERAL_CI';