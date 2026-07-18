<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptStockBalance">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">

  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày" e="Date"/>
    </field>
    <field name="loai_ky" dataFormatString="1, 2" clientDefault="2" align="right">
      <header v="Đầu kỳ/cuối kỳ" e="Opening/Closing"></header>
      <footer v="1 - Đầu kỳ, 2 - Cuối kỳ" e="1 - Opening, 2 - Closing"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_kho" categoryIndex="1">
      <header v="Mã kho" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="ma_vt" categoryIndex="1">
      <header v="Mã vật tư" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>

    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm vật tư" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_vt2" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_vt3" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>

    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="20" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu in chỉ có số lượng" e="Quantity Form"/>
        </item>
        <item value="20">
          <text v="Mẫu in số lượng và giá trị" e="Quantity and Values Form"/>
        </item>
        <item value="30">
          <text v="Mẫu in số lượng và giá trị ngoại tệ" e="Quantity and FC Values Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    &ReportDataTypeField;

    <field name="nh_theo" categoryIndex="2" clientDefault="">
      <header v="Nhóm theo" e="Group by"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I+KMgPNz07pZCHEPUE4q3LC4ORZ26bVTqIX9ZeyvpFUwIaGGVRGNDIw6ffwxRDdZw==</Encrypted>]]>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="0">
          <text v="Không phân nhóm" e="No Group"/>
        </item>
        <item value="1">
          <text v="Loại vật tư" e="Item Type"/>
        </item>
        <item value="2">
          <text v="Nhóm vật tư" e="Item Group"/>
        </item>
      </items>
    </field>

    <field name="tt_sx1" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <header v="Thứ tự sắp xếp nhóm" e="Item Group Order Type"/>
      <items style="Mask"/>
    </field>
    <field name="tt_sx2" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
    <field name="tt_sx3" dataFormatString="0, 1, 2, 3" clientDefault="0" align="right" categoryIndex="2">
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="162">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110---: [ngay].Label, [ngay]"/>
      <item value="111000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011-: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11000-: [nh_theo].Label, [nh_theo]"/>
      <item value="1111--: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 20, 20, 20, 240, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;

    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9TnGDPNRfG3RLSraAWcCrRTyWEKmbe+uVbKME2K6arOL8AkjDtBDpiQJo9dlxBO239KBP7/h2z/ecmqfV94fmSa1BKEZNMmZ4dmNLGJDILUHQwDVHpAh40yNzzP5FGGtZCJ+XV5zVY0a/ia+PSKBA+FBIpDO7hm0/ALD5xwcmYBq4FyWngJBKo6auphxiz7CnTx2T3lGav6FotEfvME7cZ8AxJ89H2t7swIOJPwO/aaaAua0SfP76AuT4rSMjHjdKHxQ8L0gv5XDe9IHYR+gQYyImuMGJy4jjUn3ZiNPo3x4gAnIq8t2Lf/29o16dgOu4Ya6ntdHA5wQkKqMyzotRvB3eiJV8XgjRWlFyDnjqW73hejo4n+d83prokQnIVJ3YdSXpndrAMdYfYYTdlPHww9TBlMB0fM6nXccGpy5oHYSKnh8esEcMnvJ+gmZgSnNu/kb7unearDtM05od6J5GujYj6Mp9qoo+iP31Nqngj9QuuOMxZv6wgqzle0PDAX/fG78s3U39Hl6DSqjfVjisCWRwuhMqeqtIIb7sSHA0Mz3o1LXr90zSNMb9Rr5bqBIrJw05WqeZn0z8fCYl7BKl1gtiwA1jsmb4P7p4lyLziFlpR1cqhN/ZuBQVRegKHlwOWI=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EX+nmf7EB/LI6C1+yjwx9mI0KiftxZsqI+iHAn1M3wrYF8p6x/72sBFtmGRYp8emKE0M0ZKo3OHxOHY+RF0o2ncOESE/n+g9on0teAUepb8WwsKcchfurjDkh/hlDN5bKP9PtNR2F6Yp7mMAqL6bCbX47wO5ALFYI0/ArN8lwIBmapnhIUO4OBod/OTOuLBdEPj0sE+LOD/xyf4WFf0TrAT2/6oNEN9kVFEJhm6lchdsH3tiifi+0yii521V7iqslBYQqCEBQXZmelxpIuClw2gjvHGZjzMaP5lsnW+AxOFBZFIztqkFVer+7jOvK7g7WDdxX/GyjGdxumDjX3ObjuI=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &ScriptQueryFilterString;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAQPuE7LmyvOyrWFWtbBGwAtgtrgfJEktxN0O6Y461Yb4dCWlv50SlDNnIJt/zNL52UJoDl4dQJW1OZ4RpQCJWuf52mEVTmfXsdfNsDRwD6GngF/EKL/TleFXopkz/+egXIr4SF2l0HF4nOHDQrnd729yQePOhQqgKzfXqPAra63+LrFpOCAnEM/b1A4jDhxJQRNrzcaJMLd8DFn141Ate8nBubLFzSU43LyT1xzY1+pNQudQQyxlcg1HGX848r2CRUK+RBj2out/I1KcteehMTVoBcRlbjR40o463joQGzdVji95vrkg4N3wwCLSFgV10mmHzPzbRQDTta89nuRJWwSYtjtC3ia6/8qV278kjtEtjcGgPM4mEZhPVY2kzFK24AZl3t6la8fyaVrtAfW4gEwHEAa0YdSVnZUXka8ebT8LM1AsU0GV9zOoA6N3orVR9HCIUXsvk/eoqFWV9NAjWxQGqA8FCxpWVDVcsbKnSkz7sySKubQjeehvnbGRAJC5PaSFlCYE4HIwZMFm1TZdBxCMd7cwEAT/t/ao/XKRzeaW0oSHuFFtNrFrmTElEya/8YqCWXcskx665cm35QJjzFhtDUGf5brt+rsWpo+EcmiXbt+znL5Sjyu8Mu+Ilz0wSapcgmHd72ltbsrdNQqfkJWSCn8fY+I9pKM+SdX3lxwgTORnkNw6AFVam8UbCzfme3Jk4AWc+RXWfVPsXbd8siMQFzMrM8LkNAzNqo9Ik1huUjkyLITZwn2dBJleXzHgDWYKR+V1zsAh07C58cXCLP2tC/9zhzTp73Y0tnazFaesS4/QR31eZboXwCFmi1PwA==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>