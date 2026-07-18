<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="sfdmnhomnc" code="ma_nh" order="ma_nh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhóm nhân công" e="Labor Group"></title>

  <fields>
    <field name="ma_nh" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã nhóm" e="Group Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_nh" allowNulls="false">
      <header v="Tên nhóm" e="Description"></header>
    </field>
    <field name="ten_nh2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_px">
      <header v="Phân xưởng" e="Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_px%l" key="status = '1'" check="1 = 1" information="ma_px$sfdmxuong.ten_px%l"/>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110-: [ma_nh].Label, [ma_nh]"/>
      <item value="1100: [ten_nh].Label, [ten_nh]"/>
      <item value="1100: [ten_nh2].Label, [ten_nh2]"/>
      <item value="1101: [ma_px].Label, [ma_px], [ten_px%l]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNsjcNw4zRKATSYfY2PZdBat1tzEVhsccBYP7ihyIrJ9DWzCpUzAssyFVVwGb9z4FprH18rntnXTo5CmOTMOlDtxfKJzMe/g/PV8cH1TUOxN</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLvjxYisS0C98zsCAhtXZjwuhyMl6Kw0uBQjS+Mp0hWCFveMCItV4IyvV/Y1ijq6aNOAtgZ3/ObFl187p32tTqxLDRHL8NtyShRIxfLlmqLo</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr7zUf/9ZOjtpNZZoZqBHdQ4eiSJFZt8UQO0xuhv1ekTUzXIULZSAnsqnPlpdgAH9eHSZT9SOL+vKYHHaiaMNTf0OQjK1nS037+1HgLg9aP/XE6yl2PqXGEPYcj3q39c1ejYzzjOAT7sKeKRyHYJyyuCL0qrGFZZBdi3Sn5JGl8PaIIltoOTIXiEWxIi+3SM1ZqsBHSGnpEfEfFUtfige5d9csqwDVUb9NzWBDqjI3nidH5z88m+GybAa5Q70syHl1I9vdCP7GBHoEXdhU2CGAkbEDJUhzxKXJQIP6uA5tfFtrPOP0CpQ0/wsABwjxpcuSIxkIv+cGFTnb39xkj3Y2zW+zYEyUbVCNx4gWJjKymIYVAr+k3sEoH6syXkzU8BfZGHf7yWZYiqPItjtJT71GwplOvRX1rYZA573GAHTsgOjc4b/0ASW1ZijOGTQ3iO4MHnvaAhvERo3PJLqTsPaXruPchTIuYTAMMOPObkWDvlgmiavJQc6d4e8q/yWGGPJ2QZ/fpAyx/TWtYmxr7QG5io0=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7Ck7qQv2W2RdgC8k5GCkFyvtOk+ilA7gwU5/Tu8VXJ8T8TE3XxA3d+7R2w4dkQB5lM1vUCqmEjm6E7sLhKZYmLkkxwuZVNdOIsoLpIDGJjr+b4QszYDEFFOzmacn4/h9hiKF7CYjlWXUPRg7LX4fiySspQmt8wJ2W2bwc/HQCh7dgNIK77/FKE/ghuCPVasu4BeUmePgowXdp5KWOkqkfrYjxiQzOEv2BZ3bJrhcNFORI=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLulFcBFU2bKHSoYUUPaBtmMpbY1A1KULnCr8WwKtqvHsUWaGUP5owbanUvcOih+hmXNMXT69SG8FP7bGOXehAluNqvBG7LDuaxC0bs922kOuLClWEKeqbctUtOTPgwrX2eu7oVsdsNd+5aZ0YXmMGS06bQuy4/vKEQZV7iJqziAuLmE3dfKkAOajV3JV2Im7QlxDVjzuniUf3Sidb+9bKphq6lnqk4uZUcrhE9vSNkbBzR30mkrR0DA6VUp15dl6Xqh04kYtc2B6LL47VhTwQEk+oxsboylRbToeKhQrrKVLZ5F7zYLza9WEhYnMkteim</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVxdSZNdUlyH89eCz0UUw1qcFGsY4enB2aG0Ejt5DW2p0</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9Hgaz3MHL7RdNe7jIaRf0bcqLHR7gWDbSMubv1PZo3GTkgLhUhztV8b9FofQv9uZJif+f8ZXgkVVMS53T48qBe7jjNZa4OR85vBIxyz6K1VUFOlxGE9XZJr96V0Y8nf/64G+uZ+I+SYVXG9oJTsfYOE8rD</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYSGlpRKfXTMAZ4HrVpQOCtcEW9e6D3eGfJNTqzKBKp2KY7dFW2hQHS05yHQcrS6/c8Zyxn4DI++dtvepGo9h9+Zz8pGwOTlhztboh/43f3y+Jv7FPJi8JD3vG4ZhTRg+5Mn+AlgPOQaT+VQOOKwouCDIgcfs2Lb25gFaR8dtf3DpJeixcasB/5xgSg1gM5bWqRgKnOptUchQH1TXHEgox1oFJJS6GsfUmQbpICBq11V4SaFgPcMzVyp68xbIwL/nDtQHzytuoibw1eQnH73RiPRBOzTOg40wX+qtMwKpnr+</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>