<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ToolSupplyField "ma_dc">
  <!ENTITY ToolSupplyTable "cthspbdc">

  <!ENTITY CommandWhenToolSupplyExternalBeforeEdit SYSTEM "..\Include\Command\WhenToolSupplyExternalBeforeEdit.txt">
  <!ENTITY CommandWhenToolSupplyExternalBeforeDelete SYSTEM "..\Include\Command\WhenToolSupplyExternalBeforeDelete.txt">

  <!ENTITY CommandToolSupplyLockedBeforeEdit SYSTEM "..\Include\Command\ToolSupplyLockedBeforeEdit.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ToolSupplyLockedDate.txt">
  <!ENTITY ValueDate "@ngay_hl_tu">
  <!ENTITY FieldDate "@ngay_hl_tu">
  <!ENTITY FieldFocus "ngay_hl_tu">

  <!ENTITY InternalKey "a.ma_dc = @ma_dc and a.ngay_hl_tu = @ngay_hl_tu and a.ngay_hl_den = @ngay_hl_den and a.ma_bp_dc = @ma_bp_dc and a.tk_pb = @tk_pb and a.tk_cp = @tk_cp and a.ma_kh = @ma_kh and a.ma_vv = @ma_vv and a.ma_sp = @ma_sp and a.ma_bp = @ma_bp and a.ma_hd = @ma_hd and a.so_lsx = @so_lsx">
  <!ENTITY ExternalKey " and ngay_hl_tu = @ngay_hl_tu and ngay_hl_den = @ngay_hl_den and ma_bp_dc = @ma_bp_dc and tk_pb = @tk_pb and tk_cp = @tk_cp and ma_kh = @ma_kh and ma_vv = @ma_vv and ma_sp = @ma_sp and ma_bp = @ma_bp and ma_hd = @ma_hd and so_lsx = @so_lsx">

  <!ENTITY k0 "@ma_dc = $ma_dc.OldValue and @ngay_hl_tu = $ngay_hl_tu.OldValue and @ngay_hl_den = $ngay_hl_den.OldValue and @ma_bp_dc = $ma_bp_dc.OldValue and @tk_pb = $tk_pb.OldValue and @tk_cp = $tk_cp.OldValue and @ma_kh = $ma_kh.OldValue and @ma_vv = $ma_vv.OldValue and @ma_sp = $ma_sp.OldValue and @ma_bp = $ma_bp.OldValue and @ma_hd = $ma_hd.OldValue and @so_lsx = $so_lsx.OldValue">
  <!ENTITY k1 "ma_dc = @ma_dc and ngay_hl_tu = @ngay_hl_tu and ngay_hl_den = @ngay_hl_den and ma_bp_dc = @ma_bp_dc and tk_pb = @tk_pb and tk_cp = @tk_cp and ma_kh = @ma_kh and ma_vv = @ma_vv and ma_sp = @ma_sp and ma_bp = @ma_bp and ma_hd = @ma_hd and so_lsx = @so_lsx">
  <!ENTITY k2 "ma_dc = $ma_dc.OldValue and ngay_hl_tu = $ngay_hl_tu.OldValue and ngay_hl_den = $ngay_hl_den.OldValue and ma_bp_dc = $ma_bp_dc.OldValue and tk_pb = $tk_pb.OldValue and tk_cp = $tk_cp.OldValue and ma_kh = $ma_kh.OldValue and ma_vv = $ma_vv.OldValue and ma_sp = $ma_sp.OldValue and ma_bp = $ma_bp.OldValue and ma_hd = $ma_hd.OldValue and so_lsx = $so_lsx.OldValue">

  <!ENTITY k3 "ma_dc = @ma_dc and ma_bp_dc = @ma_bp_dc and tk_pb = @tk_pb and tk_cp = @tk_cp and ma_kh = @ma_kh and ma_vv = @ma_vv and ma_sp = @ma_sp and ma_bp = @ma_bp and ma_hd = @ma_hd and so_lsx = @so_lsx and @ngay_hl_tu &lt;= ngay_hl_den and ngay_hl_tu &lt;= @ngay_hl_den">
]>

<dir table="cthspbdc" code="ma_dc, ngay_hl_tu, ngay_hl_den, ma_bp_dc, tk_pb, tk_cp, ma_kh, ma_vv, ma_sp, ma_bp, ma_hd, so_lsx, ma_hd" order="ma_dc, ngay_hl_tu" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo hệ số phân bổ CCDC" e="Tool &#38; Supply Allocation Coefficient Definition"></title>

  <fields>
    <field name="ma_dc" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã công cụ" e="Tool &#38; Supply"></header>
      <items style="AutoComplete" controller="TS2Tran" reference="ten_dc%l" key="(ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) or @@admin = 1)" information="ma_dc$dmccdc.ten_dc%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Hmpe4I52HSnvn41FdbOz38f54108b1hCwBIBLDRAf3VOvKjWwhOx/BBhqG4vO+Ubk1QDOobkxHd0SJuwmFoD0k=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl_tu" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày hiệu lực từ" e="Effective Date from"></header>
      <footer v="Ngày hiệu lực từ/đến" e="Effective Date from/to"></footer>
    </field>
    <field name="ngay_hl_den" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày hiệu lực đến" e="Effective Date to"></header>
    </field>

    <field name="ma_bp_dc" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp_dc%l" key="(exists(select 1 from dmdcct a where a.ma_bp_dc = dmbpcc.ma_bp and a.ma_dc = '{$%c[ma_dc]}') or exists(select 1 from dcbpsddc b where b.ma_bp_den = dmbpcc.ma_bp and b.ma_dc = '{$%c[ma_dc]}')) and status = '1'" check="exists(select 1 from dmdcct a where a.ma_bp_dc = dmbpcc.ma_bp and a.ma_dc = '{$%c[ma_dc]}') or exists(select 1 from dcbpsddc b where b.ma_bp_den = dmbpcc.ma_bp and b.ma_dc = '{$%c[ma_dc]}')" information="ma_bp$dmbpcc.ten_bp%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Eknp/YF5HQtSaJtHVmWlfAYeD8NkkkAvBtxlaUGEi/NrbDIhTUpVQflrEqCj8heMh5Fqzyq9fO7UHKLhENxh7w=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_bp_dc%l" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk_pb" isPrimaryKey="true" allowNulls="false">
      <header v="Tk chờ phân bổ" e="Allocation Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_pb%l" key="status = '1' and loai_tk ='1'" check="loai_tk ='1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_pb%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_cp" isPrimaryKey="true" allowNulls="false">
      <header v="Tk chi phí" e="Expense Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_cp%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_cp%l" readOnly="true" external="true" defaultValue="''">
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
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1=1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_sp" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Sản phẩm" e="Product"></header>
      <items style="AutoComplete" controller="Product" reference="ten_sp%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Item"/>
    </field>
    <field name="ten_sp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1=1" information="ma_bp$vxdmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_lsx" isPrimaryKey="true" dataFormatString="@upperCaseFormat" align="right">
      <items style="AutoComplete" controller="MO" reference="ten_lsx%l" information="so_lsx$phlsx.dien_giai"/>
      <header v="Số lsx" e="MO Number"></header>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Mã hợp đồng" e="Contract"></header>
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1" information="ma_hd$dmhd.ten_hd%l" new ="Default"/>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="@coefficientInputFormat">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"></items>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" clientDefault="Default" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230, 0"/>
      <item value="11101: [ma_dc].Label, [ma_dc], [ten_dc%l], [ma_dvcs]"/>
      <item value="1110: [ma_bp_dc].Label, [ma_bp_dc], [ten_bp_dc%l]"/>
      <item value="1110: [tk_pb].Label, [tk_pb], [ten_tk_pb%l]"/>
      <item value="1110: [tk_cp].Label, [tk_cp], [ten_tk_cp%l]"/>

      <item value="1110: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1110: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="1110: [ma_sp].Label, [ma_sp], [ten_sp%l]"/>
      <item value="1110: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1110: [so_lsx].Label, [so_lsx], [ten_lsx%l]"/>
      <item value="1110: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>
      <item value="111--: [ngay_hl_tu].Description, [ngay_hl_tu], [ngay_hl_den]"/>
      <item value="11--1: [he_so].Label, [he_so], [dv_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandToolSupplyLockedBeforeEdit;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibypHf5jlkhfs/BiW6G2KAWDx+XZ2rRcyfsdv74oheElCBLXEKV0W4tdLS2d83G98siwX6rTGa50cEeMO17K6og==</Encrypted>]]>&CommandWhenToolSupplyExternalBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandToolSupplyLockedBeforeEdit;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibypHf5jlkhfs/BiW6G2KAWDx+XZ2rRcyfsdv74oheEnQPKMgFiGXh8yZbhOcReOGKVudPHxK8xsaNazXcVoXJQ==</Encrypted>]]>&CommandWhenToolSupplyExternalBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGjTIfv2BzkC7+L7q9iH0iJQE1Ef5EGVYIA0r5HH36tSByQkHAykWVy58chTg401L5L0Qqsh6J0BnWGRTb+7vyuubfoHNiuKEXzA7jFugGA6</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMonP2b2WJEVogQ3K7oVrFk1LzlNo6JDhNPjRGybeTFKhD5W9Y6G7xuoBk89xsMZMvd3j0O/eYIeKvgq+hCd+NpO5+iEhS60x615dAG0r+hXY6kGLg0QPYDkrWnfBVFDLw==</Encrypted>]]>&ToolSupplyTable;<![CDATA[<Encrypted>&DgGUj9YGpQp/CxUXxce/5Lbw3rS7CwGEhnysgOVe1zj0Q3ec6dwR2ZH55z6AjAJ0FuHku07u6zoanwzleTQD+w==</Encrypted>]]>&InternalKey;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr7xPQD0e4W9lOfhvysXjoKo6hktVbHbuwo2uafM0mNvhrC9SXPOlcNa8s8uBFAtY7gdXE7MBDOMJnI1HrMBaFIEYSrJvDjWvHm0wO+ROeyUr11f1Xn9PZt5zH3+FUBqfGCbNj08dR1U3ZIdSz8SDCQjNeVlFpmFfWRdjZa/MJ66ct14FtHOCNX8L0fN5fg6No/t3Kn23UQklx+Ae7LVXbwvsrfbmq6K17Xb5KvIdYpYdSk9VgBYePjMhJS5ulpmB4aWHw0AqFw7DVW/sGn73cZPUgwSk8nIn6PmDHCILvSnphrl9QesTYxvrbeeCxy7TYkBNYeyQXXF6ivBfcUjIIqOpQiicdAHJNgbiDqKvyBA651RphchEGCgjvU5XSdHD+ccPFWAlEawQmB0pzPDGzSxIIuI0mI+Jon/kLPuQo/kTEI1d5+hhu6uJxrQhxuhqF7PVHRqAg2+kue6zMqRPNKeVwwKkKTJNBPTCe9cJ3XmETyrB+m3RyR+aj8S5pjEbDNavM+HNsOIL7hWaykq+R9LuXARGXFHe4bLygcRJTr+XuhHMBXcxmh5xHzaDLF6BJOg==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CqQkA+CAc0ekwifZZLEvnfA==</Encrypted>]]>&k1;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUMExS9PpKEdyPd+MHjj1SqTYaVQwQeY4HQMMNjPtT04V0N6+5a2UwAvgNiM4G9YrIZVGiYKzr8/EGrbqGWN8huy/Tw0gsTfYYreYhJC56CPGsQDgpt381Gemw6P4cc95sk=</Encrypted>]]>&k3;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZnFqvK02RF6hsYxg1Y572TNePW9w13x9fzHPn9qGxcb2q8GxEihKxQed4SmpBXKqWn5yquynke92WR5CdAPnV56RjFXnuqBbIVqsvnNJroS</Encrypted>]]>&CommandCheckLockedDate;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGYB74MK6vr2F1KE/dz/+QvzDcL2uJJO9Ogl6CL18nBwMxIzCp6ONAm5MXgT9hAm5TDp9gKkHvve57mgmSqrHVI=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLqHrk8+/L/kFebdlIYFrkrQ==</Encrypted>]]>&k2;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZMHckGCQw6x8e76tZNpJUMExS9PpKEdyPd+MHjj1SqTMGf+vy4nbznWMBk9C/lv6jwOdeh3AS9+utv5s6eO8tnN5kfIEBiftZPmOC9yQBGr</Encrypted>]]>&CommandCheckLockedDate;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPft13StVgGm7IDbdkSDjkdQplICqZn158j8NC6Zkqz4</Encrypted>]]>&k0;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLbWKoL5jETtroDAedIqUQR42mEpHAQGseHKQPt+hO6zMVZCLu0/56nviMMRE2b0t5VXIS9FErUnVAIrYHbfYuSE=</Encrypted>]]>&k2;<![CDATA[<Encrypted>&YARH0qdfPiWP620v9FAeSPICrzWaA8H4buAdoshnAjQ=</Encrypted>]]>&k1;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP6+iSr8HCVbXk+kp2q9xQCyr/F5R0FrkmgwobQALuY/lG2OyvM7yKvSyEj6mW6up9ZuoQGHMV5vpHatzcOsa2DogC35wxQUPyIJEVUoyH0G1CarLfVvLiAo2J7tLubwfDv8T+bDyBIhp8apgWRrMgwOo=</Encrypted>]]>&k3;<![CDATA[<Encrypted>&O0YyoFEd0hYz2N2q7aidVIJZyGVrEhl0XipY/k8D9Tc=</Encrypted>]]>&k2;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP61BTdohnbT4OEfVe/CqtE4lxeTPiE29K0mVQv6d0GrkxPJjgvwIf5SaTbwo5FtFVE4vyH2xD+CcmWlZFfQ5PLtLTCZBH4gNj1I1ki9+9tC8s</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV+ON7PtGJwPs+Ue1dhk9iTEMusobpy/mpGNP17+b7z99</Encrypted>]]>&k1;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckLockedDate;
        &CommandWhenToolSupplyExternalBeforeDelete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2ETcTEc2PssWU1yVPFTUGCGuCYRLk4bV9Bj7EUHPT+6iP49qF8CKSYuEfWYxBkeoGi20RX1ZI1l4Jp96bl04fo4KCBMwvHlZyymzMVibk2gQfhd1EPFYKybJwDVv+h8e94GToaQBkZyXDf7mykEvOmUcDDQnViAneEKuJ8NY1LZV94ouv3XBXaqT4rTEG0qAxFBD/C7gPIGiuBKCINV8WDOfmIIR3mu7UC5SiuPkeXhIzrI2YZRPOqmy54u/IH6foAaJTCKemac2mK6+G1U8cWqNCVO9ybBPn1iCIQlm45JdelYs0y3UYrEqeTD22hpYbVeOrjUGnh18jICSRTrc8t22c+PPWkLj03/3tAb8TfvwJ1ilmrsAfgEX0avcWEIFb3q7wAzwgkp9BjF+gTw0Mzpi5XIMGIwIbKuDKZBNVpEi6wtP/C6VhYqEEQA9D/HtuSCzflxPgnkSOQh6QijqvvMA=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUP95dRiIvGW8y/GIyQfB9xAsCd2KfX6O7lz7jlharcYPltXAgqhgVPRlWMYkpkK/Av6Roqepwi4rr0fHmdobRHHwc0YHm3UieCva6w10BNjhELWFnB41K/7Etio+zjvvKV1s040b/Tn3k6Rh/VB7DBiqrLoD6Kh/ny5T4DrBZxY2alUkx96z/ABzR8wc4/shzPuCd1BiHvp/+ojnX3tGeH95CNbPXGrO2hwB8NQAY9Dk2Ps9iDaAL26zvKh4hA+mb3PxlXLarahzXAFDqYSKDwKCt2hRHCc4PXYGcmM4FL0nk4+jBBXWMQLineITXgGQbRmJppQ8NYhz5TCndOR0YfHOmBueUY1qseZVmzVBozLgNSyp8g7o7jKxbG/t2XsdaW7Bz9VTKQkHvMbYcYTh7fQ7+XaloYcOJ9hpZL80UHi2mQQvjZu3YEm43SKolqjL8Zlvu73XV8ReI3LcDMTmS5sEceHaeRJbJtbhhs6FAgVeeUkz6CVIJY8+a/BuIg0hz5s025NPJllXgNJEVDN7BK6H/HjMinvER1xDjK+3/Oz3mM7/q8TAGMm4LXuTBuDGVoTZX+cpPLUiAIdi5lukgfm1z2EZKR5bmqbk77w5O9gqqYi+ND2e0v2lJnNioRE+g==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="TSCode">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLDWw5ptKvn0S+QwFGhXDSo1UI7mqtFWoyWthFFn+0Lo3SdBVfO0wW3GctqTb4ShmQKLXqImdAwcX7JpdNMREiyIlyebAWxsn8w5dyOpRuWHKNTVQHUyKbf75zixfAsih8ULkF6pnbYzVsGLeII0Qi0Ne557L8izn3+dgfUHMN9+9vqJ7XH4qlu6W84lGGjtBOpSfsNoEWjQCbI6Fp5MgL5VMqjpGkfDcrqVg0l0Pxr13glcP28ajqgU4pLlvSjDuN2G2jfZ8jQBS/VvqbFk64Dba8fxgXD7XzR9OvtaSrBQL/GvHhYyTA1wYAvOw2Xrvg==</Encrypted>]]>
      </text>
    </action>

    <action id="Department">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGbDwgv1Swt2CMXqpYBNz9yI5Ua5rVn1HqZP2mMNMBk7XuTU2QYWNKnZqA4JtLO227bBZJAOGpKYaGqfpjB7sVedIRiT1RBEXleLxibf6Ck7XrWJuNVdQX0y1aWpfb8BUETrA9NMrDrpnoYSgTpbsS16B2duPzmQYqrVw1xxIZo1ERvIjK7krIh+RqswMJmlQWNG7PdlWnfJJD4cA/8NiVsE+or4Vf8l7ahKxRCnu1Rt</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>