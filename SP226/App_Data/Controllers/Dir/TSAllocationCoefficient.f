<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY FixedAssetTable "dmcc">
  <!ENTITY CommandWhenFixedAssetExternalBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeEdit.txt">
  <!ENTITY CommandWhenFixedAssetExternalBeforeDelete SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeDelete.txt">

  <!ENTITY CommandFixedAssetLockedBeforeEdit SYSTEM "..\Include\Command\FixedAssetLockedBeforeEdit.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\FixedAssetLockedDate.txt">
  <!ENTITY ValueDate "dateadd(m, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">
  <!ENTITY FieldDate "dateadd(m, 1, cast(str(nam, 4) + replace(str(ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">
  <!ENTITY FieldFocus "ky">
  <!ENTITY ExternalKey "and nam = @nam and ky = @ky and tk_kh = @tk_kh and tk_cp = @tk_cp and ma_bp_cc = @ma_bp_cc and ma_vv = @ma_vv and ma_bp = @ma_bp and ma_hd = @ma_hd and so_lsx = @so_lsx">
]>

<dir table="cthspbcc" code="nam, ky, so_the_ts, tk_kh, tk_cp, ma_bp_cc, ma_vv, ma_bp, ma_hd, so_lsx" order="nam, ky, so_the_ts" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo hệ số phân bổ CCDC" e="Tool &#38; Supply Allocation Coefficient Definition"></title>
  <fields>
    <field name="nam" type="Decimal" isPrimaryKey="true" dataFormatString="###0" hidden="false" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" hidden="false" readOnly="true" dataFormatString="#0">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="so_the_ts" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã công cụ" e="Tool &#38; Supply"></header>
      <items style="AutoComplete" controller="ToolandSupply" reference="ten_ts%l" key="ma_dvcs = @@unit" information="so_the_ts$dmcc.ten_ts%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PG+mVfVKY+StlfHNRZbYQcVPYnOZoqWToief5fBolmxaRLI+m3aJiO9D+w0syoqKmx+ZiZXDikrS1pLLSkBYJw=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_kh" isPrimaryKey="true" allowNulls="false">
      <header v="Tk chờ phân bổ" e="Depreciation Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_kh%l" key="status = '1' and loai_tk ='1'" check=" loai_tk ='1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_cp" isPrimaryKey="true" allowNulls="false">
      <header v="Tk chi phí" e="Expense Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cp%l" key="status = '1' and loai_tk ='1'" check=" loai_tk ='1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp_cc" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp_cc%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbpcc.ten_bp%l"/>
    </field>
    <field name="ten_bp_cc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key=" status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l" new="Default"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Mã hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1" information="ma_hd$dmhd.ten_hd%l" new="Default"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" defaultValue="''" width="300" inactivate="true" aliasName="d">
      <header v="Tên hợp đồng" e="Contract Name"></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" dataFormatString="@upperCaseFormat" align="right">
      <items style="AutoComplete" controller="MO" reference="ten_lsx%l" information="so_lsx$phlsx.dien_giai"/>
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>

    <field name="he_so" type="Decimal" dataFormatString="### ### ### ##0.000">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"></items>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330, 0"/>
      <item value="1111: [so_the_ts].Label, [so_the_ts], [ten_ts%l], [nam]"/>
      <item value="1111: [tk_kh].Label, [tk_kh], [ten_tk_kh%l], [ky]"/>
      <item value="1110: [tk_cp].Label, [tk_cp], [ten_tk_cp%l]"/>
      <item value="1110: [ma_bp_cc].Label, [ma_bp_cc], [ten_bp_cc%l]"/>

      <item value="1110: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1110: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="1110: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1110: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="1110: [so_lsx].Label, [so_lsx], [ten_lsx%l]"/>
      <item value="111: [he_so].Label, [he_so], [dv_yn]"/>
    </view>

    <view id="Form">
      <item value="120, 100, 330, 0"/>
      <item value="1111: [so_the_ts].Label, [so_the_ts], [ten_ts%l], [nam]"/>
      <item value="1111: [tk_kh].Label, [tk_kh], [ten_tk_kh%l], [ky]"/>
      <item value="1110: [tk_cp].Label, [tk_cp], [ten_tk_cp%l]"/>
      <item value="1110: [ma_bp_cc].Label, [ma_bp_cc], [ten_bp_cc%l]"/>

      <item value="1110: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1110: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="1110: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1111: [ma_hd].Label, [ma_hd], [ten_hd%l], [so_lsx]"/>
      <item value="1111: [he_so].Label, [he_so], [dv_yn], [ten_lsx%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandFixedAssetLockedBeforeEdit;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6iwZByVrtZsQXG8Vmqf6e5Lfjz/Uv26VoZnAAcbFP/4Zc66TjwfAhxC8GBPz4WcSD0Zl8oCskiWd0LhaCvCTvorB4AuTaixPYFwDmMQebS8P0=</Encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandFixedAssetLockedBeforeEdit;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6iwZByVrtZsQXG8Vmqf6e5Lfjz/Uv26VoZnAAcbFP/4ZeXqGJEK9HXm0cNDfZpiWkDFkNZBA2snB9BzHGeBd0r/g==</Encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGjTIfv2BzkC7+L7q9iH0iKm00nmZJVpUPcwejneU6uxFe2U5p2rGy6i5IBwKtT5em2MFedkx7Lf1lzPxIj6DLwdc+qvpzYEzlYz5jFovFFU</Encrypted>]]>
      </text>
    </command>


    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIkHibOl3ERiVHBlw5eAxDeKZyQJHRr/+gq/RT31OTYGq6gUEunEaBPgAEyy4T/hQ1jHSEI2MYKugOFd2/tlE3te0uQeVE+qifQpV9MAfDOsA0J3V8J6z5XhavLNwDzKK8o30VAS5W6ZOss16J6Qj7qSYhTWAJ2o2H1Z9DlPhYeG5mwTzltWAef+FAV4O1cOeLgwoZQiU/v2fJIGZpSwYbY2A3cA9yuXbeokYjEBPIWtVXJgkg3FF1xh3drRe/NXKsJlTtLXH05XuAmXFU9KAOVMQNz8nCLEvppeWehXTIoTl+x3JsALIQ47BZW5Kunqp7+uWTjIx5nwJ1lrX5Fh47dBMGt18i3yra/17PEsQqb9dPXLiuY17D/HDUaHL79bgzHm89CG38Kte/bro5L32+Mg==</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMonP2b2WJEVogQ3K7oVrFmjnj5S4CL+Nk6WPUYP37syVDhzGvZY/hQYlnVIefxlaw==</Encrypted>]]>&FixedAssetTable;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbND6tjOXSzATHjIv2TIcfH5MwB/vqnZC/PJFmomtIqr4Xg5czSqJjGK5DkxKpQpVzueLe4+romKamdJdAWR0QAVp7M36gJnF7pyEonOqGkRxXR3I7wL8rJMi9eC+aj/rPFg==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU7nhVZgwtyAoHitR17+Sh/yLB9Fag8xJRmnzKYyExWBcCkoFJe31hed2E+xWx0HHW53wf2EcTsS+94WFWMALdx7P/PgoZ7LS4isChI7MHzHl65ZVG6fU2+RhXgxrc1SQqEmQa2PS1Z4Z+rffA+O3XYP1j3cTAJqhOUFk2sYARKktPR07i77Zw8x1tmQOgnNknEC7Ac+nZ4n/XGSWgYg6lsKEkyGdMhWQN1RmxzZo+8cOvE7rBXHzVR5wqyNNp7tnC3d28E/KXQ5BQnUuYYduJRw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLU1SFJlpxatwpPygCSxIwuogfjtL/0OHUDxsdHLtBnedr2vc7sZjs3Aax0E6kZh6gEbR5Ry9ZwaMwhUesUEZLd38496pl1SXagDRnEvGWW8XzS0kgOn+MHASv/SL3MK/7aGbIUYSxAscpZeK1w77tZSYsnI1Pcp0D1zJl+Bl1LKs9LcLyat9DStvT4rSD7xl43BXP9JyUGjLBDy0IevHIMrNChucCYRASdTF6s86ksvhonPGIKnAqKaixcMre7CLDwKHKXF0O8L2PPki+4JjgnGBM+CBBiq0Zhae0BIutNGrWdipxjFI6rx2k1W6NMTEhXFlE5AekImKqHIjYqV6F5KEGR3ns+U5s/MfdyG7PARkgqbhiY/GKWw5R+tUx/dVLjcOO+5k0A190cTcKQgDLj03WRI8uIuVA6lREBp3KkkRwZzKdhkywOp1ueMkGkoSiHX7gE3X3J/9w29ZEFFH6iEg0eheDSxhcZhT1fo7ldG0=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV+yGuA9M6icY272Rxfg2agMpdlgITRIFDZNaakJPqCzcPaTe4qKs+S9gBPJC55VysagqtAZstgiHC3y8nMhjuBRs692MoKiKLGQAP9GYElguXI8WC1a6lB20u1GTxzz5eulXHNS7OZLPirQC4s77MB4=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckLockedDate;
        &CommandWhenFixedAssetExternalBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtfpqqHeyR2wUbcD0fmKYtc5K9uVZT20XwzHRlKPoilTsSzc6Cl2UQeh477fSYL2ik/GlTllKZJeUwFUGHamx34ceQH6ybjrwqZoo3ODQymj7uuUFUrf5P1SGSGRwBaWoHFhutk9quNIMIAhwW1WFn4OJu08lKEWDo4GsUyPW5x0l0ljPVtGT1pAv6SVxcWS5cHMBo0A1frnU50iEdAGMMmTA4dN0EZt9zYOFWLi60JZG9BDEnBGijsBoktIeS3TAjtRf6wFP+TNP0zmHgzhuSUq5eje9mJ1uoHeq9G+Z/mOH/bQ14wtmCfau0ha4SZYILITY4b8bCDMo59MwxnaJJimsL3/857ZQGKtvAilFkQUmhVl2r+OfZ010hfEkwhb6eiFRKX6emQPbCuOWhI/fyWQiaFdkVW/AdCjKno1s0fsi+F+idPbTGyfTplHKXSVhN3cLNuyJoZXo8gqxXJ+q3H4qjtiyaHVtqN1oMp/mkeB/YsCorYvKqizSfcprqG3ZhXSjH1hnZhm/2NQsOYaMEnRJ15ktFqoB9opnxZ5ox5gE</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="ToolSupply">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7cFbwKy9v570A9+YQUOrQSAJdlXyCGqQkTuI9t3IPdoBigawk/EL66FgY+gLi6h9H0YJAsPlCro58Cf/0p4Y5d5TwtWouAkveDVIUrtv6vj7SWrxCTZvHpzhi70oKkbFkas0KwVcPlF6OShrrDpbvXQPpL+PqftJ8rJhBMTdf5QpaJQtVARzFWrH97A5rx08G8D0VwRHPIwNoy2Ep7bNteephggZ37tv/+eekeP5ArU0fyZE289Dilabkql5MtuTSO8P/GqJjzmUiCknkPW895Rq4wP35ILL6P/nveDv7Q64bt9KScxYal6LA6rMEdkWg=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>