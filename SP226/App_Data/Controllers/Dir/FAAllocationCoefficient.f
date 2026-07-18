<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY FixedAssetTable "dmts">
  <!ENTITY CommandWhenFixedAssetExternalBeforeEdit SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeEdit.txt">
  <!ENTITY CommandWhenFixedAssetExternalBeforeDelete SYSTEM "..\Include\Command\WhenFixedAssetExternalBeforeDelete.txt">

  <!ENTITY CommandFixedAssetLockedBeforeEdit SYSTEM "..\Include\Command\FixedAssetLockedBeforeEdit.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\FixedAssetLockedDate.txt">
  <!ENTITY ValueDate "dateadd(m, 1, cast(str(@nam, 4) + replace(str(@ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">
  <!ENTITY FieldDate "dateadd(m, 1, cast(str(nam, 4) + replace(str(ky, 2), ' ', '0') + '01' as smalldatetime)) - 1">
  <!ENTITY FieldFocus "ky">
  <!ENTITY ExternalKey "and nam = @nam and ky = @ky and tk_kh = @tk_kh and tk_cp = @tk_cp and ma_bp_ts = @ma_bp_ts and ma_vv = @ma_vv and ma_bp = @ma_bp and ma_hd = @ma_hd and so_lsx = @so_lsx">
]>

<dir table="cthspbts" code="nam, ky, so_the_ts, tk_kh, tk_cp, ma_bp_ts, ma_kh, ma_vv, ma_bp, ma_hd, so_lsx" order="nam, ky, so_the_ts" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo hệ số phân bổ khấu hao TSCĐ" e="Fixed Asset Allocation Coefficient Definition"></title>
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
      <header v="Số thẻ tài sản" e="Fixed Asset"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l" key="ma_dvcs = @@unit" information="so_the_ts$dmts.ten_ts%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DOFODc5mffb/stFFyG/jPZ3EkiPnIDxvRHCAqn0Hlv7QrsOmQTrSU/54eUbbaf4g38UGLT7h6A6iVK+FHK6sYk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_kh" isPrimaryKey="true" allowNulls="false">
      <header v="Tk khấu hao" e="Depreciation Account"></header>
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
    <field name="ma_bp_ts" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp_ts%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbpts.ten_bp%l"/>
    </field>
    <field name="ten_bp_ts%l" readOnly="true" external="true" defaultValue="''">
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
      <item value="1110: [ma_bp_ts].Label, [ma_bp_ts], [ten_bp_ts%l]"/>

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
      <item value="1110: [ma_bp_ts].Label, [ma_bp_ts], [ten_bp_ts%l]"/>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6id3fA+zYlMhGEEXl4gpMn5fZ/VQdaF8G7oQ6NxVm03Uq2iEeI+sO/q3BI/0SfLHzYZKmprySa1CPsdyL6WVpNKTzM9eM5hjZ1vh4r48yMO80=</Encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandFixedAssetLockedBeforeEdit;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6id3fA+zYlMhGEEXl4gpMn5fZ/VQdaF8G7oQ6NxVm03UqxWgTyZwlwiDSA+K2PkNSVsnOIHIX2TYVtPW7YGzeTkA==</Encrypted>]]>&CommandWhenFixedAssetExternalBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGjTIfv2BzkC7+L7q9iH0iJOceq7qc4v2NfFp3uEl6JaKwTpP4kIKVJ9ci7xM2IhHWNBxr5stfB8gcuVcjfkGeHBfxySqGinDRJp0Bkoo/vs</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMonP2b2WJEVogQ3K7oVrFmjnj5S4CL+Nk6WPUYP37syVDhzGvZY/hQYlnVIefxlaw==</Encrypted>]]>&FixedAssetTable;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbND6tjOXSzATHjIv2TIcfH5MwB/vqnZC/PJFmomtIqr4Xg5czSqJjGK5DkxKpQpVzueLe4+romKamdJdAWR0QAVp7M36gJnF7pyEonOqGkRxXR3I7wL8rJMi9eC+aj/rPFg==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIkHibOl3ERiVHBlw5eAxDeKZyQJHRr/+gq/RT31OTYGq6gUEunEaBPgAEyy4T/hQ1jHSEI2MYKugOFd2/tlE3te0uQeVE+qifQpV9MAfDOsA0J3V8J6z5XhavLNwDzKK8o30VAS5W6ZOss16J6Qj7qSYhTWAJ2o2H1Z9DlPhYeG5mwTzltWAef+FAV4O1cOeLgwoZQiU/v2fJIGZpSwYbY2A3cA9yuXbeokYjEBPIWtVXJgkg3FF1xh3drRe/NXKsJlTtLXH05XuAmXFU9KAOVMQNz8nCLEvppeWehXTIoTl+x3JsALIQ47BZW5Kunqp7+uWTjIx5nwJ1lrX5Fh47dBMGt18i3yra/17PEsQqb9dPXLiuY17D/HDUaHL79bgzHm89CG38Kte/bro5L32+Mg==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU7nhVZgwtyAoHitR17+Sh/yLB9Fag8xJRmnzKYyExWBcCkoFJe31hed2E+xWx0HHW4e78AeZr8vIPPhBTq32QW2pbR03s/9Vfmf1zX9L0JU8Pf58nftrsaJMlzs9vQFlUnn2R7W0+5/s03Vk8k7jIfT3hJ62vn5rNVBXhyUwpN/l5CyiQZuGShhOeyP7I7Z5pHls+niNNEgA5LrcdA2lf0LJXgCUbrQrqwa1XW6B5aKDJ0KjUYQ3+B+Z1D4ny1Lz6dh0fpCfmISSDH0gpA/P7uw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLU1SFJlpxatwpPygCSxIwuogfjtL/0OHUDxsdHLtBnedr2vc7sZjs3Aax0E6kZh6gEbR5Ry9ZwaMwhUesUEZLd/bctvyx1iN7CCbBeRpMB9Axa2lcvh0o11bZe92icsPxIlS/mDy7lxV2rTFxVHOH7YELhiCjwT1nMWiHA98b/xqXQLPW/040ZM7uXZsNG8NjrfKVmxXvofqK25VgCrlMPsLdolrDYWRGjBnks8qJnMw6QJCI3kdsRzwh03ntFlf9gRBqph+kZ1zW68/3wPJ8yKpE4Pmp06UXhKrdK36tbms5u2JoJwQA12mJTh0ifrwQ/Uz5u2DgBqYkEsiD3Ihw9xS9z8Xu5UsxaQdr5hR0qIHhtaNHlTlQmefnm7AfuHMcQLrkEMw/rueMmYVitLTjCCrxGXlZsryhjruRfyMmBR3TRyNu4FqalGmmBPdm+IpWZm4cR/lFdHrF5IQHgn+tFw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV+yGuA9M6icY272Rxfg2agMpdlgITRIFDZNaakJPqCzcPaTe4qKs+S9gBPJC55VysVKSaBQEFAdmOSfg/90eXyeXuSvKXiKZbtti8TmNm/RjpsKy/HB4bWODK0SZkL7T2cdIDeEzqnchgjLuc8R/xBs=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtcqI5qC58CpzcOSbLSrt+Q8RqLOY+Vz592qnJGRCl4Fsp36v49VY/9kY+qhTrJYkmUXEqGjVcVyzS64Q4y2MOhjyBAwfkoNqhqBnzPVE/leSQXjqcHTAO1IgJCf+5jaFe2amjx20TUVBwZo2eZkvpI6iShtUN0uomo35GdeyqmXvTpDnJ535oMczhd8w4nO8BGO6MuXKVSADEQLCUMB/8LNrG9KKJdzU24kWB/5J4mQne8UzqrSX1jYXzyCLVnJMrExSRulmabG4hcBTmKgsGZNHkjaamGuwJ9chRssh+2QuVMaBraPUb16jhBQqJVT/nDZ1yWn0updqGHOspeLamAFTGijyz0sYc2+buqd5v7oc6dtNNuhl8EOe7QP5OA6e7K6T5w9rH7jh2Db27t/VQf0rFb2lHqziEWtebjW4nqZZ9UJIfNt6M23X6ZysrB5Bp+fGHxfdBiCmS2NqQ4p6Q0wUw2wjDrc05hrz/9lnIiuKdNa8V/mYKEIP23rvYTtyyB0dONZBxjK+W6gipXiJRH+A8yTWZds2OUDlyvlagAu6</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="FixedAsset">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm75uFB+nnEKkkRs3Ko4g37HkMbWCkW45QHqNnyx8ZTrpke8Xa78nKKZlf2I5W+sHVY4AVslR9BhGvRl5+1U5w0zsgHJTt4Fi9kEq/HWohswd1xmBd8R9M9tugGJjG3uZr/DEHS8aif8YKxWkEwzL8zxB1dj//uo+BswdfNuOOytvYjLnhH8zmNMMZO63oozYSEXt1LI8fhmtNAVijvYiLGsE5mtDQxQIekeJSzGSoXCiz34OhZeDUkGu5F/V8o8Fw4XdQRCvuKS3YKtvKXoGq1HLCYJA1DVlAvbiwR0DkHHghc6wqrx72nFIg4LccuS4RQ=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>