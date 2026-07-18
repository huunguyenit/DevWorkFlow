<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">

  <!ENTITY ControlFocus "ngay_sc">
  <!ENTITY LockedDateKey "ngay_ks >= @ngay_sc">
  <!ENTITY CheckLockedBeforeInsert SYSTEM "..\Include\Command\HRMCheckLockedBeforeInsert.txt">
]>

<dir table="hrdcvaora" code="stt_rec" order="stt_rec" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Sao chép theo nhân viên" e="Copy by Employee"></title>
  <fields>
    <field name="ma_nv" allowNulls="false">
      <header v="Sao chép từ nhân viên" e="Source Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="(@@admin = 1 or (bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID))) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_nv" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_sc" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Sao chép ngày" e="Date Copy"></header>
    </field>

    <field name="ma_bp2" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp2%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ClUfLFvA2bsWtfmSRpPYszT8x7cWQuIOBmBpvvUeY0S5Ore0WKlJO2Ac+q5O8je2opQFoZIB26J4zjRi+LQbhY=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_bp2%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv2">
      <header v="Danh sách nhân viên" e="Employee List"></header>
      <items style="Lookup" controller="hrEmployee" key="bp_ref like case when '{$%c[bp_ref]}' &lt;&gt; '' then '{$%c[bp_ref]}%' else '''' end and status = '1'" check="bp_ref like case when '{$%c[bp_ref]}' &lt;&gt; '' then '{$%c[bp_ref]}%' else '''' end"/>
    </field>
    <field name="type" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Kiểu sao chép" e="Type"></header>
      <footer v="1 - Chép đè, 0 - Không" e="1 - Overwrite, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="employeeID" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 100, 230, 0"/>
      <item value="1100101: [ma_nv].Label, [ma_nv], [ten_nv], [employeeID]"/>
      <item value="1100---: [ngay_sc].Label, [ngay_sc]"/>
      <item value="1100101: [ma_bp2].Label, [ma_bp2], [ten_bp2%l], [bp_ref]"/>
      <item value="1100000: [ma_nv2].Label, [ma_nv2]"/>
      <item value="1110000: [type].Label, [type], [type].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFju3VLdoQVgKDZxKvtIi768OtxDiMlhwlOFJRlG0Vh9qCH6oNTUvpfgLk8BCBuzVizDBGeObjQXVFQj6dCcpzkUnhkeXs1J2SpIsa1TYn64</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDs1lFzrmMJAb3vrkAYR0Uy0i/lO9foqZP8eOeUynqj8Q7UZH3SkYUt42lyLvgOPp5dN3FAEHz8+q+zJuQpq3CgI+7FjXtNszEqjk94c9RHv</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CheckLockedBeforeInsert;
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TVJ97DZ42u5JYHyWJAgfOkGvdg0hUNSFpUgXkTY1EKnH+qpGjzRBihELmKUMQLhFdpZ5/kkJcUaMaQZbBJ00GsC51MhmBylNFAVSqnY0JOdOlCoc99k9B3t23tmMsdQT8IKAv4mmCX3ZH7yg8zfEeM=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTrws+XdWP6Lbom9JHQHYGrioI1r3CZMU0YTU8cT1NEbBlSa/7op2/2OFtLDycFG1ja/0+xQS5Uo6uPDOFL8bVdY7OALD9hVB4I7g82lyTDwNHjl3d9eXiM/Ik/IuJSjyHfGfAkKINCobBY0jrn4+zVSEGnH+7gddygq6o2E3mh1oGdrkakXBr5fObMKrNmKWzWcrW5PbC4En5An1Afyrj3ash5LLZWWcPTNxvhf9zsibT7P+gji5yh+SlZk0harhXF2lSWVb50Oehz+iFsG7OpqgsKVf3BoZcHgdlQKt3AdKx6jxaqNM+E+gPAXX2SALdbekVBllUlwgXE7GkvSRr2VR3gSwB2EeKf44faNf8hqiz76E6YniahMTWirv45eTVLKiVd6NcGFm5+Th1aTwDBOV6wUZree43kLzj5cvMNYzd7vNPNxIahqxt+7fxagWM1t44LlOlpu978vZXmqsS6CnZm8RQwfOQZcNwF0alTKAL61gHoznraTDpKGhWKi8x+x+6OamsjcBIkic360tYx/u3FUgDFAoSy+4H0K4KnDFxrBs6rHu9eWrMmbJkYiH+04qjutOaA9NlfWi7VBbXzwgcqJXWd0V28MpquCgvsj</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reference">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/oKUmX0302sbDhc8SCfv6qyS+57AZX9OCiqrO8xBUUDDla/S+iis315fb8H1wy3bNUsmpPt7PJrYyq6X4mptNX3DKas7BI64B2LRp1VJOARoAZuWnTSKjK6ZADNk39h7HTzNiwidGjIdhXsb2Qgt6PVLzN/Pj4zjcge+JV5MdQg</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>