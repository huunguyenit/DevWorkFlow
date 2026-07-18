<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
]>

<dir table="cdpx" code="nam, ma_dvcs, ma_px, ma_lsx, ma_cd, ma_vt, ma_lo, loai" order="nam, ma_dvcs, ma_px, ma_lsx, ma_cd, ma_vt, ma_lo, loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tồn kho phân xưởng đầu kỳ" e="Floor Stock Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" allowNulls ="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1=1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99LAJ9h680G1zBiB6VhSyb8ToAyDoxukf/p7zuNknHzSg0UR7TxpGMY7mZvZ6rsh7qxZAQmcqurEEypvyA7JPrVc=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_px" isPrimaryKey="true" allowNulls="false">
      <header v="Mã phân xưởng" e="Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_px%l" key="status = '1'" check="1=1" information="ma_px$sfdmxuong.ten_px%l"/>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsx" isPrimaryKey="true">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsx%l" key="status in ('2', '3', '4')" check="status in ('2', '3', '4')" information="ma_lsx$vcs2.ten_lsx%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99LAJ9h680G1zBiB6VhSyb8ToAyDoxukf/p7zuNknHzSgMqifOeGQyRxkW4rsVap5zdpntR+MU7ADIxSkSCyxKnI=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_cd" isPrimaryKey="true">
      <header v="Mã công đoạn" e="Operation"></header>
      <items style="AutoComplete" controller="SFCWorkOrderOperationList" reference="ten_cd%l" key="(('{$%c[ma_lsx]}' = '') or ('{$%c[ma_lsx]}' &lt;&gt; '' and ma_lsx = '{$%c[ma_lsx]}'))" check="(('{$%c[ma_lsx]}' = '') or ('{$%c[ma_lsx]}' &lt;&gt; '' and ma_lsx = '{$%c[ma_lsx]}'))" information="ma_cd$vsfctwo.ten_cd%l"/>
    </field>
    <field name="ten_cd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_lo" isPrimaryKey="true" filterSource="Optional">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c[ma_vt]}' and status = '1'" check="ma_vt = '{$%c[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="loai" isPrimaryKey="true">
      <header v="Trạng thái tồn kho" e="Stock Type"></header>
      <items style="AutoComplete" controller="SFCStockType" reference="ten_loai%l" key="status = '1'" check="1=1" information="ma_loai$sfdmtttk.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ton00" type="Decimal" dataFormatString="@quantityInputFormat" align="right">
      <header v="Tồn đầu " e="Opening Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="lo_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230, 0"/>
      <item value="1110-: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11101: [ma_vt].Label, [ma_vt], [ten_vt%l], [nam]"/>
      <item value="1110-: [ma_px].Label, [ma_px], [ten_px%l]"/>
      <item value="1110-: [ma_lsx].Label, [ma_lsx], [ten_lsx%l]"/>
      <item value="1110-: [ma_cd].Label, [ma_cd], [ten_cd%l]"/>
      <item value="1110-: [ma_lo].Label, [ma_lo], [ten_lo%l]"/>
      <item value="1110-: [loai].Label, [loai], [ten_loai%l]"/>
      <item value="11-1-: [ton00].Label, [ton00], [lo_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmUJo3D7MPGunQGWeQpLUtwRyXeWSPn0DpdrUw1dGHxOOcFxP1sElyCJnRauNfsteDOomf5UmFVAssKN4hoHImc/cNFXdJjP3JWeF5Jf/eHhs5OhWx5nW40HL2Wb2LvgrUlbYxfYDUcWUMe8u8xIL5ue8mbefsOWJeRdt1a0f3/11crlSrSdyYOaaBnl1s18aofvJxxUnvFxdUQjGaY764YPUX0E9HhoIacT7XzKGT/5eTxEeOdq7BzKfEMnopsLwx0+Un/U+3PrvgJ88nMbvkWEvC1Jlh2H3AyhGP62inhDuU0PgPU5Vn0hYEQWV+7DYl8FnttWEQ/GAPYzi+LwBPC</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmUJo3D7MPGunQGWeQpLUtw+WSl7kE0CwhYqUv671pQy34cF2F6PtIDkOFwqdjIJFqinR/7M9DGWlqrcqpGlUj2dbdwGXme3dP496Lpatv4773GLUeVmn9GtTd2mXnHqkk1CJeauOc4fFxeJqKHlGeohPT71RaKn6YfWBVvHj6EBXnDeKGJisJE8TV+Gdl9Rcc=</Encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ilXtBbJ9vYoP2Hq8Ov7Ru42mmcRSTTZIij24Y+1fNJKS/Xfr+xdiDJZbimrzcjlGdQdKDpr4pR5jkaiqmiea4EQ==</Encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGjTIfv2BzkC7+L7q9iH0iIcf9kIRRIGjzS7SNoKrwwbjzHg1+7MpVKxasB9DD9rUX9t6bHeOOP0FJjToDljmDcArALPl76tTDA+JA4mK6VY</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIADDcCd7YtWpasZiDM8yvopMQf2WN5LDc1QoQ2NbyiZedpL9+5gBtZzBhWNEdSV2hzhVs0GI6Rj2wwwzxQxwEw=</Encrypted>]]>
      </text>
    </command>


    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIkHibOl3ERiVHBlw5eAxDeKZyQJHRr/+gq/RT31OTYGoEc7PFWLUgp/BFvktLSwkoE3Qkl+qMCBLRut+hZReJNslJSOKdIdSsumOs0LHJvX/gI8tHXhUypV16a/XXskhGbU+rHIgwfDy6WsXtQ4FP0M9YuGRWhXHxU0jOVnvbOceddYR8PFzzLXwtGaAw6qMGsdx9W+KFt3i30Pg0TQOSfHxIuHYcnWINWR2HwDsihXPSwEVNcvpZzeB1GfDf/X3IPJ3A14tJ7lBR3H9yQoDcVdJfjQDWMSzKsI9VvxnSpga/APKlay/9hjcA7+fU2OBm7sWOWPvj/ptk1O1MzhbsavuraLevEXG/aqDbUXRFOWvOgpSA5BogzBs0kYAKWbncFgJVHWUdb/X3kRjQjpMxog==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CYeyFRrMu01EII4SCUyA6sq/o/jrEV/WMkUJtQr7Opb/5zjv0PaRZ2UfAukBJ/RqKXOr+kVjgDM4US1V0+dvgbH8vafNHcoQR6h9hXSN5TOzYJzE9bbyecJtNRUy9kpe8ST2DhqkyLwEoneOqbWdgz9G6blCTXs+kLBOQA2GFaNazTis+20J2mD7t/Zp00ZqZo8aziFFPfB4wJ2AFt855DqMl2oVVnKoz09Gc8sg9+oOUn2hEoFnPhkapJo9e9jV8</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKT0kRkBNmrsE9Ov1OJQlcrQKtKAAEJNVpNjCfFlfgPe40EQix5tjeif/sFebW8/Y7KjQTXip88oaljtXWITv2gpiYUejCRlL2ymmTQOQGXN8QnofizmGcmyDTbHv0gx7idhIOr94wMoFloxzD7IFz0y5DyHEGqSRNahT+bkb3gvpUzkJ1DgmWZCcax0Lfd492leCg3/irtIJAyB19/lGr2J/XbiD8+t7qi025Otx2DQuDvY44igYyLaIncK1bHftCGFtBSAc6hk8PqsbGaMRs6gH9M//SBjGUDOe6Q7R5Wg</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzte3yC0YcqS6gvUjO+2BRoJ6XHCMqU2lNAQOowMifXqGxMGhIDsP+7RoYsrd1nAMqVxwKTWmizRsrkE37ylNUYQrQurdzMZYlTs2L0QgyoujFOuFFvVpn+zMJMTRc251TeFN7aFYqMntwyPrrxjKVazODFuBZpLAn3QN4Fk4Qt4mOCVWRlsJh3dzeCpvCNaneQrGuNYH4I0EdqPB2QbNpFYkuCFMdHjK63PtmE/RQ6Ss1y00hK1DWBLPwFu4HJ+mmzuqib6C3Gwf0I3rlh0ClY+IigehfOU5KKWkZU7mr2sqtbsKBvoQilfSzlFti58OppIiIuecwKvLZ2+LKSd5TTjfbYhlAPZqsmGvIKn+/qesEVaYlc0a5d0QiW5UefugDAl</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV7lv1In5cD9YiV4kE7LoPQaqwqhvamXBzVKOSfs0T/xuEszXkFIMHNAjvubCLETUv3My3qKVrusPqeAkjaoy8PSWKsL+pcjJVUZwVbmz7Berm2LM4u6mC7JnSkUgtrzYuL+LVrJW114JTiBk/tgjOqNqQVGZ94uyPUlR3Sm5dpNaJgzLNxedeKAlrQLgRr6RPuGgh718tmb6EPch9TkgCzxp1chk/ZMkjUVZ3qw1A/3w8l4roaCS0lNhAdcu5YPtfzSIvTfCJHyywoVDRFQtv4hYJq7gTsBc81Xbd6pNK0HjmQr3eJ3ND6hHsoBZUwBoF6R9P0uvb7/M0097ItIPvM4Q1uBWm7SgV5ldCdt5n208</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dUsFiuBX/iYGBOeR/lqE321hTMnQ3rF0X8jNlGSJdBqqBSOkhTUi4RRejGWS+0B5PD7mI6KzVs7D1m2u2o0iJqFt5e8Ip1tzpAkfFjLA9kQ16XrobytEkmJrCGn0hsPj143B3Zs2Ewq7VnMRLGlVq/P5GWFbXnsrYajKa6g7/VoTfOZ3EInMtlJ+u4QCVoTMDVAc+LgOeYHyt4RQkdU7n+UJXLXybRL/49Ir3rz4KxJfFWsHBv2ZGHtWLYsfhVnDpXbjQIfxYr4gBR3Gx6sUSg1gwe8FatewBNc77ti5WQKJAzbEkc0nStBsaVWa8LcAWi/qPOLe9vRfQUz8QFEvNI5LOEIX11U209oTSzZkV0h1cNhqBr6IH0qI9c7LSScaFofberatGkTy4jCxYbpL51btakH/wG66EecVfTCo3BfoCjCxV5Ib8/jnhkvAt67Mbo8Gl5q9u8COAl2zOz05Pi4ELlg7FW+SvGQqLz8/b8R8A==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQuNb9FmpvMIV7G+iuy3Wr9TbJe7IlbOoBkjOuCfD1QHwlOwB3Fe0LwpUbcPlJaXLuUdlux4Kixw9/g+zpfmTxHlXNlg7lsbveDqQGkJPfaHmlbMKyioOAQmZYEEmXBwwbLFL1AFtA4L1250KMA5U7ehxnHR1+QKI+FMclYAJRle8H0Iw3/H+J/7MufdEbTXjawuIu5Qt+sh2/QIYAa2XbdH/Heeptad8qeMdXU/dKHdpykDo06REDLadN4A+oL6ndkl9X+QKGDsLlBIxVVWkY6UlNWf417//kutRbo6PPxD+hptV+5X0uFrSjrzSXO7SgBekd/LQqA6CgCrgdCo3MmVajpsF11ma0H6G5uFGKhWVJW1oOTtyq1Fy5jqbrRbdTxWJRWe7La4lBfZfbf1z+H4V/zAUmh5Tho6vdTsJH2yVd86cNdXxEkDC/r4znEs5DQD0sIz3CQorOPc5laHTGyBj6J0/F4ujQm77F9FRjB3Df40jc49Q0EQmT8pBe3f+3fAHlYhs4Ts5ORWjin5bCOV5nt3ibkn8Ezw3oFkdCyIhk1d/logsRWAPLUPvIvtX4ipwk283zZ18lj95BDLigEdosovHEjXXQvZ9/H2tYkFYPji4oob+gxsYV9NLQjp3y6WsOCOQeXb8Ujw0WbfN6SoW2WnTMu5BzXhD9YLqsi+Y6s+K3e0Bh/cS2RnW6mTP6vV51vWmXi5wprPzDqJ4zGaBT7Admz+jHLUAWNL4xdu</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXBkAICF53BYDQPa1mnrsQ+bHi8SjzeEK1s25S89Nb2wB</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>