<?xml version="1.0" encoding="utf-8"?>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn ngày làm việc" e="Select Working Date"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày làm việc từ" e="Date From"></header>
      <footer v="Ngày làm việc từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày làm việc đến" e="Date to"></header>
    </field>
    <field name="not_vc_search" type="Boolean" defaultValue="cast(0 as bit)" inactivate="true">
      <header v="Không xử lý khi tìm trên chứng từ" e="Not Applying to Voucher Searching"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 100, 230"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="-110000: [not_vc_search], [not_vc_search].Label"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnQ6JIJ0DAjKFJBEciny6nyvbflFD0u65L7R5eSSbe1rUM/mFco27g4MjDJcvwCLa2ghf7RFCfDp00sOwKfUszEuR4GFKEv+qsz7Y3olr6X9wyRk8H05pnd5qn4TRNTOeOm/b5ARcRMuvQhN6f1YWmigweKcTK9aExwOwiDUruyqABZbhcHBFPE9gILWIm0gEcVTL/CufX3HMMIc/3+4bIUCCy/VwYBq2jiPcdMGzS75alE/SfjT6EtcQZy4bGXA+OlxPIxD76X+pjl8fK1+ALSKBtFc2ug+9w6XlmwXVbppYw7AH7EOf9g2MDvC2HRxLafKqNvN6Pu+5CtufeNeghfkAm7p8qyxzD/B8aH/ViS7TaU0UW8nIdrObrkTJ/07r+NIvdmoPqvfYQIGQkjrnbW6BlWWWjrPd2jooNtYQyjIaUz1Q8ZU8d9Nq1SRzreddE=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EQpJQOkp6uTiUIFP7HUzQr5bFlaAU5W4oAB+u21Uif0nM8Q+z3pOP1VJK5OOEaHPFlnfYDyRzMDCkH8gkpt3seVQg94gmvnbbey4UaJBA+jvBVFZDSx8K5iHeTH/uYq8gfVGzfTxDLsJcOWIfliLY00TJEiMeDGYGkOQZrNrM1OXlR7f4E4uWsVVnkbQMhvpVkcBB7KfPMoU1Xi1+iXvYpXWJCO/lj2VciwYPsmvw5L4/OEqb+OgcFDw9Ftf0phbjR/obDPTnz4KmnFuwirDG1nMGRLD11LdXdxS1/xivb6AJWL8MVx4oDKZwwWaqjiD8jTYXcBkof1kWYA+a7lWGtg=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp88TvisNkYL1h5ND4arJospHwHuVL3ZAV+NCL7Td+3JmqC/rdSB27vTm6IALXDzjvxgo87ltb5tbFxfd78dYaqZ+x/w2GHkB1Xi9FeUXOvqzIYMF0VhLB7+848hLN5gdEtWlOLrbqIdn7zU/DkTDBTBZ0/oD1b+t9Jm0y60g4VRi9GD1CbGscOWgDeSyvS+NlQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xFut3UFiUrAbxvQqYPMMrQPFCNskj2IxtTcZSWwPYd99OYbl/PEKQSMoE9U4b91Eeps59cljjZ4n5j1LtHS+eKuGtXFKxzTp41kzHM41RReOFKO9jAD+88cylciz7f66+yv23STapMwmZaMm9Eg/70</Encrypted>]]>
    </text>
  </script>
</dir>