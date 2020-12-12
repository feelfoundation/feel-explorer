Feature: Address page
  Scenario: should show title, summary, and transactions
    Given I'm on page "/address/16313739661670634666F"
    Then I should see "16313739661670634666F" in "top title" element
    And I should see "Regular account" in "sub title" element
    And I should see "Home Address 16313739661670634666F" in "breadcrumb" element
    And I should see table "summary" containing:
      | Address       | 16313739661670634666F                                            |
      | Public Key    | c094ebee7ec0c50ebee32918655e089f6e1a604b83bcaa760293c61e0f18ab6f |
      | Total balance | 99,675,450.108366 F39                                            |
      | Transactions  | 2 1329                                                           |
    
    And I wait 0.5 seconds
    And I should see table "transactions table" with 20 rows starting with:
      | Transaction ID | Date                      | Sender                | Recipient                | Amount    | Fee     | Confirm.      |
      |----------------|---------------------------|-----------------------|--------------------------|-----------|---------|---------------|
      | /\d{18,20}/    | /2017\/06\/16 \d\d:09:08/ | 16313739661670634666F | 14989416087250274755F    | 1,000 F39 | 0.1 F39 | Confirmed     |
      | /\d{18,20}/    | /2017\/06\/16 \d\d:09:08/ | 16313739661670634666F | /standby_\d{3}\|\d{20}L/ | 1,000 F39 | 0.1 F39 | Confirmed     |
      | /\d{18,20}/    | /2017\/06\/16 \d\d:09:08/ | 16313739661670634666F | /standby_\d{3}\|\d{20}L/ | 1,000 F39 | 0.1 F39 | Confirmed     |
      | /\d{18,20}/    | /2017\/06\/16 \d\d:09:08/ | 16313739661670634666F | /standby_\d{3}\|\d{20}L/ | 1,000 F39 | 0.1 F39 | Confirmed     |
      | /\d{18,20}/    | /2017\/06\/16 \d\d:09:08/ | 16313739661670634666F | /standby_\d{3}\|\d{20}L/ | 1,000 F39 | 0.1 F39 | Confirmed     |

  Scenario: should link transaction id to transaction page
    Given I'm on page "/address/16313739661670634666F"
    And I click link on row no. 1 cell no. 1 of "transactions table" table
    Then I should be on page "/tx/3848396513989474236"

  Scenario: should link sender address to address page
    Given I'm on page "/address/18234943547133247982F"
    And I click link on row no. 1 cell no. 3 of "transactions table" table
    Then I should be on page "/address/14895491440237132212F"

  Scenario: should link recipient delegate name to address page
    Given I'm on page "/address/16313739661670634666F"
    And I click link on row no. 1 cell no. 4 of "transactions table" table
    Then I should be on page "/address/14989416087250274755F"

  Scenario: should allow to load more transactions
    Given I'm on page "/address/16313739661670634666F"
    When I click "btn-next"
    Then I should see table "transactions table" with 20 rows

  Scenario: should allow to load less transactions
    Given I'm on page "/address/16313739661670634666F"
    When I click "btn-next"
    And I wait 0.5 seconds
    And I should see table "transactions table" with 20 rows
    And I click "btn-prev"
    And I wait 0.5 seconds
    Then I should see table "transactions table" with 20 rows

  Scenario: should allow to show votes
    Given I'm on page "/address/16313739661670634666F"
    And I wait 0.5 seconds
    When I click "details tab"
    Then I should see "genesis_1 • genesis_10 • genesis_100 • genesis_101 • genesis_11 • genesis_12 • genesis_13 • genesis_14 • genesis_15 • genesis_16 • genesis_17 • genesis_18 • genesis_19 • genesis_2 • genesis_20 • genesis_21 • genesis_22 • genesis_23 • genesis_24 • genesis_25 • genesis_26 • genesis_27 • genesis_28 • genesis_29 • genesis_3 • genesis_30 • genesis_31 • genesis_32 • genesis_33 • genesis_34 • genesis_35 • genesis_36 • genesis_37 • genesis_38 • genesis_39 • genesis_4 • genesis_40 • genesis_41 • genesis_42 • genesis_43 • genesis_44 • genesis_45 • genesis_46 • genesis_47 • genesis_48 • genesis_49 • genesis_5 • genesis_50 • genesis_51 • genesis_52 • genesis_53 • genesis_54 • genesis_55 • genesis_56 • genesis_57 • genesis_58 • genesis_59 • genesis_6 • genesis_60 • genesis_61 • genesis_62 • genesis_63 • genesis_64 • genesis_65 • genesis_66 • genesis_67 • genesis_68 • genesis_69 • genesis_7 • genesis_70 • genesis_71 • genesis_72 • genesis_73 • genesis_74 • genesis_75 • genesis_76 • genesis_77 • genesis_78 • genesis_79 • genesis_8 • genesis_80 • genesis_81 • genesis_82 • genesis_83 • genesis_84 • genesis_85 • genesis_86 • genesis_87 • genesis_88 • genesis_89 • genesis_9 • genesis_90 • genesis_91 • genesis_92 • genesis_93 • genesis_94 • genesis_95 • genesis_96 • genesis_97 • genesis_98 • genesis_99" in "votes" element

  @ignore
  Scenario: should link votes to address page
    Given I'm on page "/address/16313739661670634666F"
    And I wait 0.5 seconds
    When I click "details tab"
    And I wait 0.5 seconds
    And I click "vote link" no. 1
    And I wait 0.5 seconds
    Then I should be on page "/address/8273455169423958419F"
