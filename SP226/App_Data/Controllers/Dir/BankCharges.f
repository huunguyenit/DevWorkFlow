<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY DefaultForm "3">
]>

<dir table="dmcpnh" code="ma_cp" order="ma_cp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phí ngân hàng" e="Bank Charges"></title>
  <fields>
    <field name="ma_cp" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã phí" e="Charges Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_cp" allowNulls="false">
      <header v="Tên phí" e="Description"></header>
    </field>
    <field name="ten_cp2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="tk_cp" allowNulls="false">
      <header v="Tài khoản phí" e="Charges Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field  name="ten_tk%l" readOnly="true" defaultValue="''" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_thue" allowNulls="false">
      <header v="Mã thuế" e="Tax Code"></header>
      <items style="AutoComplete" controller="Tax" reference="ten_thue%l" key="status = '1'" check="1 = 1" information="ma_thue$dmthue.ten_thue%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OmNDCVFUMNWS1+DAu1YZnMVNAHYWmnJX91Q0kxWpmeF802kA0+lsqYMmp6j6LG1Cw==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_thue%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_thue" allowNulls="false">
      <header v="Tài khoản thuế" e="Tax Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_thue%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OmNDCVFUMNWS1+DAu1YZnPRdv/XaKfjp9p5WIKZw9pHiN2n7BuoB6FlZNzngdhGIg==</Encrypted>]]></clientScript>
    </field>
    <field  name="ten_tk_thue%l" readOnly="true" defaultValue="''" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh2" filterSource="Optional">
      <header v="Cục thuế" e="Tax Authority"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh_thue%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh_thue%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="mau_bc" defaultValue="3" clientDefault="3" allowNulls="false">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="AutoComplete" controller="VATForm" reference="ten_bc%l" information="mau_bc$dmmaubc3.ten_bc%l"/>
    </field>
    <field name="ten_bc%l" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_tc" allowNulls="false">
      <header v="Tính chất thuế" e="Tax Property"></header>
      <items style="AutoComplete" controller="TaxType" reference="ten_tc%l" key="status = '1'" check="1 = 1" information="ma_tc$v20dmtcthue.ten_tc%l"/>
    </field>
    <field name="ten_tc%l" readOnly="true" external="true" defaultValue="''" inactivate="true" >
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

    <field name="tk_cn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1101: [ma_cp].Label, [ma_cp], [tk_cn]"/>
      <item value="1100: [ten_cp].Label, [ten_cp]"/>
      <item value="1100: [ten_cp2].Label, [ten_cp2]"/>
      <item value="1101: [tk_cp].Label, [tk_cp], [ten_tk%l]"/>
      <item value="1101: [ma_thue].Label, [ma_thue], [ten_thue%l]"/>
      <item value="1101: [tk_thue].Label, [tk_thue], [ten_tk_thue%l]"/>
      <item value="1101: [ma_kh2].Label, [ma_kh2], [ten_kh_thue%l]"/>
      <item value="1101: [mau_bc].Label, [mau_bc], [ten_bc%l]"/>
      <item value="1101: [ma_tc].Label, [ma_tc], [ten_tc%l]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvlp8b21aG71Pz+WyKdihaUwsziokAPrkTAovqPSEPWIyb5ZxVNBqKfc3rUY1UuxwFfWGX6BL/s1e5+PkPKhjB4roecFe5oW1lijYmc1qFZWtR7+PCIOOiC0OtmZ0kXQ26FeVKQyHtfEFRM3QPBe7Tu1YrWoLHxWHmGIDACQMPXmRFVBkt/4lP97k0v7cQWF8fUHWinFEWD/DrH5FAt7Q6o0CN7VYvAXoh/3L0WTCaX82ZUoKzA6AoaoZMWsaEyA61LglqpmGMtsgVruncbXqkFdaB8G5WF86NXFCixBARbeQkqeN8jE2RHayD/F9d38tAc=</Encrypted>]]>&DefaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR79VL4gKRjnRNwPQ/UqsQEMSRjnjlU4r23kIDCMwzO6vdTlZOgspg6l8YBTh8ZWPm3bSkhAX0O7zUr5AXknVD0QHWGrvS1CSZ4xTQEnpis6Be65DSSHD2PTpBR2HehI6XIULmpIMJZxaJVPRGLA3Xdrr0dwEQL4IAwh6q7R036xnS0etBIjJo3r00UM2ExHyV994VbrSLBmCOg1v8FrIpdDJ3vvtHlPNzY8Bk01EJl64jju9RmBoUKmc9F6w1/LY1dLAuGGwFNqa2KFDz0SjiRAnEtQJMDs7Q1AbBbxffUwB+cWRy1vvl0wz0cwOT76UGaAPIRrc3EzTJfNYVmRP5XCv5wxvANaN/IBTv9HeKBSAvI0p5BbbaDVRatdHtaqoMpTOlpR8hH0sfHgDYMNuAcV70CqsKM4v/5srH5HV0XG31luHE8cMX2dH0TCPK+NvxbkRi0HR54P/lqy4yNr8IRH7vzCV3NPgeFgb/B4Fb/MhitTRv2zuJ7PZGKyvuhy7v+XkV1v7sK1D3c2z5g3a0NcuAi2/L9lcF3ayxWO8bp2XcGYACeIW22Ry2xzedF6aZCA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBYezWCrEMH1fHatEHfnpceEyb8h5zJ3GW3BP3ef/PN8QA9rkpmOlwTunkHmd3qfe8lrdi6e3Ip+cqHIcReYIRw=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLfMZ/ueEO78aUp9lIQHj9A0ARSjNXC/AL2CrT2YX3bULUFuQTLjd4hP/aMHfDg3gmztBFOIXhWEt5ygypRuyxLPmjF3EspVSqK+iYSSlKVhsd2YnGO6RpZVzCQ9nnNs6A==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIJ4yQ/VaiAtUYcq9KiWRh40S0QTkv53TcrGyL2RuimRq4os59WdrBl0z0kRj/8w3zzHYr+W/57JTA8Ne6CL5DN0v1fx906+F1hReIFFKg3jxDMCCgkCmU3kKbTBvs1jG+1CHkU08SH7bHfVTDCcC2yujbSYtKj0m//Lfvubb3f6EnBIWusRqKSLk9yyhQzSekER05TQEKLIhtFDs6fHbsGVadaG5Yp/vjcYv+BFfuS36hoCe7bcoLaF3TjYzHz/3NMWvyJyCjxFpdqK4Fv/Vq5iz4QYu4UemhcArY1aiDzK8wm5DrBhE1t44tfpXTyuHXovkGUsZkK9AekdYJDjCdfg==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUwTXOa+ef63Cx/CHuuy9ljViLHN2n/zEbnLf9SukgkZTuABizGJPfXbXfJS+8zKcYIbR878bqrEguW6Q4vkTHJGyQA8LsrqwUGe9yvSqntwL6J5+lmhG4LqAYqdh/RvlhALhTT9jWgivaGfpA1tDGc7UarPqZbLrKT+3lYyC2whof0IcOA95DsV3GpW0pqDtp+Doum6uXemUG5SX24YXl2lVepKUMgMCbqb8/J8MsXzY=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLDQbo4YHeJLjNYoG2z+BNGZZ60NovbeOsAYw17uR43i1OFbOE2/Ef/pftFhR/ObKouNBLHK4vKkocTOO5riqJsksA1D0rXzW0CXdXx2XZvaJlDYM1kkbaQEnxQbX+tYs6J5HHWE8tW4j4Knt1USGFYJCujA1Wubbg4nFuNvNcdszqIg0WpfeEHB5deUNRbHXsGgSTDjmuTZ6RW2Q8mkDavxniiIkH1s8EO7uwu7DeDqiMgPNJDIpk9nfETdtWCgZt</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV67I2DgiA8AczAXLVPQZYCxRx8x05tCRWi+k+c1hhNs+</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTDCEoyB0i5as/aYQ/9CkTSqOG1pQkTrNn4hOcNK8A8rBwnYsEghW4AXKbH0ykjTlnOQIJ/rbmElwQDbMIJedONmS7yr4GlvTgAG+SOJfe3mEooqpWpKaiDxfHgfuak1kxAvWnBTD1q1YEhLqVfpnugudR0+ZocJzbIothwHAycQ1SEnadqs32ekZBP+q1k+Sp5p2/wN6j3vh1CPkdddnhDwWaCwc2vaUMMvT9TgizDp6wgcldUUg5FNOzJaSQaZnMcBv/OuCRDEBACds9k1imuyZjeU7anKu97U2n3k7g/Lndjh0l17yCn0jip47PjMLq5GXcBT2XpmbrNsJ1v66gKbguSn3CDPmgw/n+g26C1xgd4+TrTrwxORlX4BO/XATImuPK70hB3bHR0jNHhiWHqtzVYKMRcQi1N3GgflloaA8LYfD4TG7YtZ4S3zL1TTqXeX4qcZsCSYH6ktVShDbsoazRrktROgnfCNA0+z533K0loj0eMYcJQvfeWsmgyLTQD+wDeg3MzV8nccCT5KnFAHk3xIHt8naxHuhzxOr3iPFbnSLl3+bt8LDR7tLlYGduY9dddU9Ii4vYatUK+NDu8uoVUvtCnFOOTxLbQgYGgcnYi+5hMfYtpRDIVZ6UFG0OdyoLw5iKE5IPlcoZ7T97igiX5821+oDauW0e7AZ9/phokovnCinwyR+t79KD86Q8vKn7tuYUx3plnIeT+5MJmgnNW6KdeHJAhmMeEAJAQWB1+2LAYquY24bmA4wLTOXTnkL0rVOaFB6d7lsaYsvYgGjTwspm4cTQJsunBJkEkZJx4qrcq1dgMBL/9jsPbIOaUB1DXFW/LJSj2ZfYaKHDxvrtQ99z7JS0/bH02pecw7</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <response>
    <action id="TaxCode">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm571/REZW6SEdohQZWf/Ft/g03DzPbtCaIuoRiMHA2yF6/2vap0PwIa5d7hgAdtwm1x8Z3q/TlJmQ6lrFdWQ6f3MyICDj6sn+rMQz02dzcQcvznp8MWU0s0GwE15bzgvwztqSDqbdKCa/lGsbGeolq+Qpl8X/Aq4RdxHhECSJmZP95ZbKUHn3hdZECX1/+AcSLM8pDMziuP/zE2ES6xdqCd</Encrypted>]]>
      </text>
    </action>

    <action id="TaxAccount">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G1ya6B6zTt88iIkDt35JcN65GrNQwtRdQRqiSfstpYFmHGIece98XyBYEkUW81XyAO5OFaMJx2MGBl0iL8Ie945rqOcuDA39Yx8ifBUuUuVOvum3Dzyc11J7mMwVv+qTn7cXcY72zYQ45pHU+mihy</Encrypted>]]>
      </text>
    </action>
  </response>

</dir>