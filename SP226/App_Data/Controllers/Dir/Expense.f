<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY Identification "Expense">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">

  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Expense;
  %Control.Unit.Ignore;

  <!ENTITY c "ExpenseUnitDetail">
  <!ENTITY h1 "566">
  <!ENTITY h2 "106">
  <!ENTITY k "ma_phi">
  <!ENTITY i "1">
  <!ENTITY Tag "dmphi">

  <!ENTITY % Nested SYSTEM "..\Include\Nested.ent">
  %Nested;
]>

<dir table="dmphi" code="ma_phi" order="ma_phi" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phí" e="Expense"></title>
  <fields>
    <field name="ma_phi" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="&ClientDefault;" allowNulls="false">
      <header v="Mã phí" e="Expense Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_phi" allowNulls="false">
      <header v="Tên phí" e="Description"></header>
    </field>
    <field name="ten_phi2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1=1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" categoryIndex="&GeneralCategoryIndex;">
      <header v="" e=""></header>
    </field>

    &UnitFields;

    <field name="nh_phi1" clientDefault="Default" categoryIndex="&OtherCategoryIndex;">
      <header v="Nhóm 1" e="Group 1"></header>
      <items style="AutoComplete" controller="ExpenseGroup" reference="ten_nh_p1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1" information="ma_nh$dmnhphi.ten_nh%l"/>
    </field>
    <field name="ten_nh_p1%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="&OtherCategoryIndex;">
      <header v="" e=""></header>
    </field>
    <field name="nh_phi2" clientDefault="Default" categoryIndex="&OtherCategoryIndex;">
      <header v="Nhóm 2" e="Group 2"></header>
      <items style="AutoComplete" controller="ExpenseGroup" reference="ten_nh_p2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2" information="ma_nh$dmnhphi.ten_nh%l"/>
    </field>
    <field name="ten_nh_p2%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="&OtherCategoryIndex;">
      <header v="" e=""></header>
    </field>
    <field name="nh_phi3" clientDefault="Default" categoryIndex="&OtherCategoryIndex;">
      <header v="Nhóm 3" e="Group 3"></header>
      <items style="AutoComplete" controller="ExpenseGroup" reference="ten_nh_p3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3" information="ma_nh$dmnhphi.ten_nh%l"/>
    </field>
    <field name="ten_nh_p3%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" categoryIndex="&OtherCategoryIndex;">
      <header v="" e=""></header>
    </field>



    <field name="ghi_chu" rows="2" categoryIndex="&OtherCategoryIndex;">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="&BottomCategoryIndex;">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    &View;
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1fe1Yy3Ybxt6J3gSRuhhazGOBw4aDGjUbMIbJo0MhFqle6Cg8q2pmz/fVRRgI67mzw=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBYezWCrEMH1fHatEHfnpcfqNs4pQ9gPy53xlGQny6rrEHaU2byFkbAsCs+wUqY1wh829XN1ipw43/xPXZU7KYg=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVfK/NCPDhMSW1bAIXdU+QckZVgeFDw1lvwzbW4aQLPjIwaS6ACvBtbFKkH8K44onDq//wP9L6RECYZlDoAlCwfOUGHFll+gIMQ8mqjrVnfW7wSIvnQ85SUMNl/qe2P2UhS9P+DZncObExS9XSFwCeuownHkP3RLnSvWVBWIKmtRQ=</Encrypted>]]>&Expense.Nested.Message.v;<![CDATA[<Encrypted>&q0x/DRPtnEN53dA6mwugdrrnlzj/yVK8sbUnv6C5b4hJOCUzCN3IWgEzXF4j+MS8HQAibjz8vd0+6msWwz4wWW1OZimYYZ+j5wiQWEIoJltVH3iV1IoYa1gCGYNOHnKDGztkW76iLkpKKGUyWmlAiw==</Encrypted>]]>&Expense.Nested.Message.e;<![CDATA[<Encrypted>&Gf3AUkJFg+tajSC6Sx7Gz6nmWt1Ha4WW/5tuOA5WB8AA/T8l3rbtgCtunFekX+1f8hmBA8rQLd0Zf+s22+/+2c7IALBKqku1bGi2gGLm5pxdW8BMVvZF/NvXO2WeDjZZp6o9OmeHirFj2nty9Ut+aNINhHRXjMu7fcP9nI4cpuh88zSaqC9lIR3oyHybZsN5FPGC7FZPmV/uid7zKTTvyb/1Bnzkmlyt3n9pDaTI3VK0TPE8P1MA06QxMhcH4PbpyK6P5fK9OwjOgKuFeNhVmu9dH/37kfj1nXUoudYM38uSYzDMfxdQYxX9IrJ1ejdIrdFnhxr753tqAdR9CTstF85dN/TbUWDtL1iu4IG8umhyiIamS2YhOqg3XfcaIapNeo9saCkVBHAV8IL+aZ/E8rftXf5hMT/FujfBToV0o4Lr5KBlVKJ+YNq11BtSvSty</Encrypted>]]>
      </text>
    </command>


    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU7vMRJi5phIo/q55KJkMZKQ==</Encrypted>]]>&Expense.Nested.Key.a;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUOzjTFhFreigsRDJjh69v/zkMnmpH5K5M7lSydoCMCZrZgHRElitADEQpCSmPDbXBEPjClYs4yRCl0UOP3ONeptPt9y5cGLZ/Shzs7KvHDCjA==</Encrypted>]]>&UnitBeforeInsert;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGYB74MK6vr2F1KE/dz/+QvzDcL2uJJO9Ogl6CL18nBwMxIzCp6ONAm5MXgT9hAm5TDp9gKkHvve57mgmSqrHVI=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &UnitPostInsert;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLmWNDWEvGixVg9Oba/Uxp5lYcBITTaw4MAUh23VzDPlGBHoalfc2fQ1m2WbWrBmcpY9dQWfX0xuz6cZeK/1C04TTH8N0qmdy6IgImWu46sJDxXnoKkRlyVQPGcD75EQKr+RqCC/BZtIKs1qkfkB56r16kmHwVlBXASltLueK2zGqhzFBoTyhBcPQKF8ApbizF</Encrypted>]]>&Expense.Nested.Key.a;<![CDATA[<Encrypted>&O0YyoFEd0hYz2N2q7aidVMq+NCl/4HWSWeisMdumwHr/QlowUK+pqFgJQoapTKchMVqe++G2JADMLizYZN5xIgQU9ZLF0ElBHcH6y4BOiy3mEHTtR88sLRqBXgMZ0HhTiMXKmp5RUJBCINNsuEPREcHQ348ebj+CHWqQcxaXOYl1BMdXTffLvD1hUqFA42q+kMJHf1FD8V04JGTS8nKbxJ84w56rq8zVOBEhALCMRNSCDVXtuKEeFrG3PBlnUHZs</Encrypted>]]>
        &UnitBeforeUpdate;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVzUi7GOrqwnsYUcitlaTek37RdVNlcsR2PXGnGeYWHwz</Encrypted>]]>
        &UnitPostUpdate;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmlX/1G4VEF8z4pOWdpqPPKEZpLXua7Laz/vu9gWWLySVgtgIPPBM/N87GKpq/tLvc/xfQGlu0a1p+ABVXbVbvBR8wc1ZnzpBaOML3CrJHp2DTcSbRky7A1dEmoYh4KByGNgMBAsVkdRsOxq4lvsjQrWJqFgfgoF+gdWlskUB3QnAJsrmgKW/VgZAM6S3PRlZo=</Encrypted>]]>
        &UnitPostDelete;
      </text>
    </command>

    <command event ="Checking">
      <text>
        &UnitCheck;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtb9vYMw3giFva4ATFpyAqEDMHl5TSg5e4Ov2z9pvk3K9gt7zxXS63XQZEZaPsRG6QNAk3NvpZaZycuaMtvTgYBQNv5nH/KUUse08aCdiwLJMcRR983fw81cQrTHUxJOEvsY/Z3KCarzQzJgIYmn4C4tvAHLIAxykP1HZOvks/906royF9q3mRrkysNA45jKpjfJDvUqt5jM9XUiJ04H4872KLQuaJ3KJ2Tbok6t6ctQBkgsSoRdWklvgQEJKag7iWW4r2OWLAnksbvNl1HV7fWU=</Encrypted>]]>
      &TabChanged;
      &ScriptIrregular;
    </text>
  </script>

</dir>