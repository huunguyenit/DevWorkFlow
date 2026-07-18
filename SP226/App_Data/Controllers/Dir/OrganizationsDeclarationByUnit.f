<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CheckTaxCodeCondition "@ma_so_thue &lt;&gt; ''">
  <!ENTITY CheckTaxCodeConditionExt "">
  <!ENTITY CheckTaxCodeConditionByVAT "">
  <!ENTITY CheckTaxCodeFieldValue "@ma_so_thue">
  <!ENTITY CheckTaxCodeTableValue "default">
  <!ENTITY CheckTaxCodeTableQuerySelectWarning "select @$scriptConflict = @$scriptConflict + @$taxCodeInvalidConflict">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;
]>

<dir table="dmdvcskbtc" code="ma_dvcs" order="ma_dvcs" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin tổ chức theo đơn vị" e="Organization Information"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1) and status = '1'" check="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99HkVfxpISmEKx9D8z75Q/14t62cg/8pvq8pwDD9Y+aOVuj4LiBPYUVhJtL5PTBJlDQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ten_tc" allowNulls="false">
      <header v="Tên tổ chức, cá nhân" e="Organization Name"></header>
    </field>
    <field name="ten_tc2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_so_thue">
      <header v="Mã số thuế" e="Tax Code"></header>
    </field>
    <field name="dia_chi">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="dia_chi2">
      <header v="Địa chỉ khác" e="Other Address"></header>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="8, 112, 25, 5, 70, 115, 215"/>
      <item value="1010010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1010000: [ten_tc].Label, [ten_tc]"/>
      <item value="1010000: [ten_tc2].Label, [ten_tc2]"/>
      <item value="10100: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="1010000: [dia_chi].Label, [dia_chi]"/>
      <item value="1010000: [dia_chi2].Label, [dia_chi2]"/>
      <item value="10101000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSesqNXIl+kdAsZroBdqAwnEFp+uggm7zS+kDKobONBqB5fdR23JECSx+5OtVYoTfO8NE667sJIzgecjqDIdd8=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSxUTjSdwpeFyDkTvWrtBDxYdschcoSN0YO1jhKP+qY2CHOfKmezXDunkei5Fkwm9h3v5+phgUDVw/XFTgaiec=</Encrypted>]]>
      </text>
    </command>
    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNI7MmU4LYahXZQ2pNs1uDSyOGRaAQZG5NvTJ8Dri4I5hmUww3CtEP1xxNBFfI+U3RgW0yy9mF0QiJgSks9lJ30e5oa/6qtP8B0auxS8unlFrH/GY+CoHru5Nnd7OmAx4ssoLItDOuCWEVVokATPQ4Ook9Xcq8hxrvxkWJC2IOClqEOsmq8+JPjH9djpzugZy9u4Z/7mBl/mAMUMpIWgdRzhHWP6X1vAJnIf2hj0ETEyAD7pG32UCnSPteslNSBnHewFu7gYvhjzqEVd90n0c6BU1ZT77JyMzAwXKwA7siLsGpmx5oMz31rLlZg5ZQ4PHynq0kLBmHPxhMtRAp6U7WIaKe585cSPPoHpyQnEUzIu3Sg5b7A1di6nQ9gdMrRoMqX6IWPnn8DkmJt1BZK+ecbTA==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7COsECWWyn98Rc/nJxknHJsz5zDqd8SFqARqC2V+RDaXwF33Culn6Cx1pRgGOtohdf/iTj2nO2CyapZLhfl3L0Yz01b89Bg3r8h3GEhGt9GVe4dCb9dAyqqg0QW/Vjcl/3MPRxY2PCwJnj5vmAbd7XaxraPoVWPJ1NYohxtVBwmEPr1S3UtGtDcwFs4gtNoG0v</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &CommandListCheckTaxCodeWarning;
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzte4EKdMhLUEJ4nUER2zh4COONR8zqferpPJ5VsltPPoMyw8wSmSXxwgIDV1DYC+Nqjn9WBrLdH20ZW9cegYj7A/HiLZ1JYaJ+JuH0VLgaXrAxbqy03TLhPdqoVReILkEFtwMK6vJsKIVKNxA7RiRaUtiDZgIsUQNR6VLHftiE5wLlfIJaFqKy4UHl+Z9BJnzSa0fYwTTs+TaNGgn2JKxtCXw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV4QQfZcz+1YOoyxk05eTubctA4p66065h4yjvxYUl2ui</Encrypted>]]>
        &CommandListCheckTaxCodeWarning;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptCheckTaxCode;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9ym7CeEjqWu8yDMh3+OaS33eksut7oDr7XTrtBSr+3q5B9NQXIUtEEUzevAphPy9+8YH5Naf7GSxswjySGIlPSr2cQdPuv4LWA+lC5oK0DTxofISe9k9qLChh76ZSbWpXTPx33a6EXdvCKsYBeyhdI2GWXxSkSRV2ElWxFHZm+IqdOBjDR7AJG4SKJheOivd3ihiaIVfYoZuUNrxs9eR9Y/R855Dn2Pkpn/V1JZMFwwx9xfXL73x9eDdwJ7Fk3dweHeino9dGGNcMTUdtQDswuH2wv1lHKyQUKRc25jyXK60itJD0Jd2+LmQZqBRlvfWtJntUaVXL4ixvHJkK91eKSNUPq2rvQea0bgTqOEX7D6qQ==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Unit">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5PG26AcpktNIYZU5/5dJVFW5hrqxMTCx/Hl0Zi8VjIu/QU7p/aJZozJ99IDwOJmezs3M1/SIbSuecSNY57VHZHnO9i6z6nqgpzxa6P32V7wsAWRHM1ZA+/G9tgCoYp3vmUa+2KohhdC3EpTzaOowEWZeMxwElA5rR2zZX+81855uAEEAYoIG2QTgGsR/X2yxE=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>