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

<dir table="dmdvcskb" code="ma_dvcs" order="ma_dvcs" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo thông tin theo đơn vị cơ sở" e="Unit Information"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1) and status = '1'" check="@@admin = 1 or ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_so_thue">
      <header v="Mã số thuế" e="Tax Code"></header>
    </field>
    <field name="so_dt">
      <header v="Số điện thoại" e="Telephone"></header>
    </field>

    <field name="tk_nh">
      <header v="Tài khoản ngân hàng" e="Bank Account"></header>
    </field>
    <field name="ten_gd">
      <header v="Tên giám đốc" e="Director's Name"></header>
    </field>
    <field name="ten_gd2">
      <header v="" e=""></header>
    </field>
    <field name="ten_ktt">
      <header v="Tên kế toán trưởng" e="Chief Accountant"></header>
    </field>
    <field name="ten_ktt2">
      <header v="" e=""></header>
    </field>
    <field name="ten_tq">
      <header v="Tên thủ quỹ" e="Cashier"></header>
    </field>
    <field name="ten_tq2">
      <header v="" e=""></header>
    </field>

    <field name="x_dt_sp" type="Boolean" clientDefault="Default">
      <header v="&lt;div id=&quot;hidden_label&quot;&gt;Tính giá thành theo&lt;/&gt;" e="&lt;div id=&quot;hidden_label&quot;&gt;Calculate Cost of Product Group by&lt;/&gt;"></header>
      <footer v="Sản phẩm" e="Product"/>
    </field>
    <field name="x_dt_bp" type="Boolean" clientDefault="Default">
      <header v="Bộ phận" e="Department"></header>
      <footer v="&lt;div id=&quot;hidden_line&quot;class=&quot;Break&quot;/&gt;" e="&lt;div id=&quot;hidden_line&quot;class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="x_dt_lsx" type="Boolean" clientDefault="Default">
      <header v="Lệnh sản xuất" e="MO Number"></header>
      <footer v="&lt;div id=&quot;hidden_line2&quot; class=&quot;Break&quot;/&gt;" e="&lt;div id=&quot;hidden_line2&quot; class=&quot;Break&quot;/&gt;"></footer>
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
      <item value="10100: [ma_so_thue].Label, [ma_so_thue]"/>
      <item value="10100: [so_dt].Label, [so_dt]"/>
      <item value="1010000: [tk_nh].Label, [tk_nh]"/>
      <item value="1010001: [ten_gd].Label, [ten_gd], [ten_gd2]"/>
      <item value="1010001: [ten_ktt].Label, [ten_ktt], [ten_ktt2]"/>
      <item value="1010001: [ten_tq].Label, [ten_tq], [ten_tq2]"/>

      <item value="1000000: [x_dt_bp].Description"/>
      <item value="10000: [x_dt_sp].Label"/>
      <item value="-11: [x_dt_sp].Description, [x_dt_sp]"/>
      <item value="-11: [x_dt_bp].Label, [x_dt_bp]"/>
      <item value="-11: [x_dt_lsx].Label, [x_dt_lsx]"/>
      <item value="1000000: [x_dt_lsx].Description"/>
      <item value="10101000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8UdDCl+MNonjHpmo49GxHAbWCE3EMLfaOGl32SEGJPvq6f0PLK7rr7ed5azLfwre+N0Tw6gqxBaADsCWYeCSNO9SFO8YUO1s3yLdLsmg0mTLHlwp2CM4TKwgGChQRSG90WF7xBtR0kURl5tUhOPcJnNcX4NPgEIRWK2TgAaeS9UZizrNt6jQVCNaN7Wkb7lIRm/KIpT7OHGRsKuq7IJsM8I2izXsZuugCGjT51Zn5R6Q==</Encrypted>]]>
      </text>
    </command>
    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNI7MmU4LYahXZQ2pNs1uDSyOGRaAQZG5NvTJ8Dri4I5hmUww3CtEP1xxNBFfI+U3RgW0yy9mF0QiJgSks9lJ30e5oa/6qtP8B0auxS8unlFrH/GY+CoHru5Nnd7OmAx4ssnF+jAoDkRyuDonBKHyPmwJGLTsHNJJvcp5Vg+tIeo9VEwIx2vc/JshzjMftjV2AXS497vyT/mp+3lR7SynxsxVZhLkvWXlE0oUFmR5MAaDT7/hOSZw8BuTABZ/3bfqafiwVmz+JO1kkgZYTPN1uPjYbl6B8OU/r8S1vfxcASpZYSg+1n4ePGQoLk4VOGs3hoyyp6b3YfEovNWRuVFKcG0TtB/j8g8OPKFPpN6myuNcJKbjrJ4TO1kSsoMUedAfbs</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu45NnizsOl6BDB5ut02rtm90fjqFH7AT5gn2qN1jh0vNuOsRbnv9mUSrls+TaWTxi3IfYMOapV+DFlDxIVa75fjn1ZVnRlAX1KTnnl6jxbb1NV9w23CDmuGPpB8Nuz41FowttxygYPRf/OLCN1l7e9o=</Encrypted>]]>&CommandListCheckTaxCodeWarningMessage;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/78/PKXNy13cL5/M+DpRN86pbmAiT7IDP1usaGYsEKDrQ5+G78Tvczc3ZQPH1be7r/XegQw1PKOMDCd6Gpu2K4+tUtN895FKFuULrajZvkAzE3JRVu9kv/dg5pICH+JRIt1g==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV4QQfZcz+1YOoyxk05eTubcE/EAE7m2FJslFPqNWKPXwNFdcrr2HPywWRawNUEFl+OR5QPlGhWEcBjDHD9O0nPqhQBqA1p5mHX20mIKTxNLXoMK2MfUDsQzT+gf5Wt6edza6o4SjixPJhdfaPy8NgKWNDDYIu1fU7lqL+9yJUNu6</Encrypted>]]>&CommandListCheckTaxCodeWarningMessage;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/78/PKXNy13cL5/M+DpRN86pbmAiT7IDP1usaGYsEKDrQ5+G78Tvczc3ZQPH1be7r/XegQw1PKOMDCd6Gpu2K4+tUtN895FKFuULrajZvkAzE3JRVu9kv/dg5pICH+JRIt1g==</Encrypted>]]>
      </text>
    </command>

    <command event ="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu45NnizsOl6BDB5ut02rtm90fjqFH7AT5gn2qN1jh0vNuOsRbnv9mUSrls+TaWTxi3IfYMOapV+DFlDxIVa75fjn1ZVnRlAX1KTnnl6jxbb1c0SpGMqeoVByN5NHorndgfN6QIKOEbbu7aBl2mwo24cnYya8ig3iXofc8+bTTD0zn9HJpod0iZG5yT6y5YsyHyKNjQfu35SqFEaFArtUfCipQZY7XUOPrvSgVYPJNAf4</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptCheckTaxCode;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtX8NWQ74mYvBkiloEJjeT+jRsdNlhHAvmqZY4vN+BDMGIdqLP+COD5yZCOhd3h0iUlGTD7W2Yuvk0YXj/gKRZMPHQAc5uVhzqD9vANJuCtVZofRfnkNVSND3tCBUt17s/Ffc4I53Si8DsFqWV1mU6cjcprYlEKPswrF4NiUXfBiWu1Feu9LWdz5Q1BCK1QCDVA==</Encrypted>]]>
    </text>
  </script>
  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1jG6VWeGAcv3M25z+vBq/YUELg3A+LaU/g+75YddH2MioYzVSZN7XIVuLwZdRmGe43KKROWWuTQdEAkAhQTXjONP71kKI9Pdmf/NmL5suGS0Rod7Nj1cdsAki5F7RbXOskQ3hJlHTERTjAiK3UXElAkfOhwoBZKQU16Y3qXo5wMsVvHUCG27l/o2QwiNpFtWASOEkRMAM98cdHNRzJ5CB4=</Encrypted>]]>
    </text>
  </css>
</dir>