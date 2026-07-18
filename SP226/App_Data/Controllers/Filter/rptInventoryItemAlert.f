<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptInventoryItemAlert">
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
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mã vật tư" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" external="true" readOnly="true" categoryIndex="1">
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

    <field name="nh_theo" categoryIndex="2">
      <header v="Nhóm theo" e="Group by"/>
      <items style="DropDownList">
        <item value="">
          <text v="Không phân nhóm" e="No Group"/>
        </item>
        <item value="0">
          <text v="Loại vật tư" e="Item Type"/>
        </item>
        <item value="1">
          <text v="Nhóm vật tư" e="Item Group"/>
        </item>
      </items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I+KMgPNz07pZCHEPUE4q3LC4ORZ26bVTqIX9ZeyvpFUwIaGGVRGNDIw6ffwxRDdZw==</Encrypted>]]>&OnSelectionOutline;</clientScript>
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
    <view id="Dir" height="138">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110: [den_ngay].Label, [den_ngay]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      <item value="11000: [loai_du_lieu].Label, [loai_du_lieu]"/>
      <item value="110000: [nh_theo].Label, [nh_theo]"/>
      <item value="1111: [tt_sx1].Label, [tt_sx1], [tt_sx2], [tt_sx3]"/>
      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 125, 100, 130">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9TnGDPNRfG3RLSraAWcCrRTyWEKmbe+uVbKME2K6arOL8Fh1CmJbdrcK63fVKKM8FYVZEY43r7d78F4qxEkHFjIwJjJsDS27GpaNhC9VmScQcoX0APBoK1jS8yhmXbkrjWayJ4la06XqNXh6TJWLfKB5K1E4SZ6WEoSB3oz1g0GKCuocfmKBJuavTgxhMELS4V6DKCG53C/h1hsQ9YE92oozfAoh7j1rNl5tIDVJlLq3Hy5u4qgyHyusycO47ww89cq2xe/PNv20SeUhj38w0GzwjdWsVx/EVfPYqryCVN//8Jt3qGNDT00vPyp4ZkyWtZcYyND3KOX1BhPbmom5vQsSbIMXjurku/GHQeqK5fdYVFCc8gX9fefeEACwgcyDvRaZ0CCP8+1chZOA7cbY7q7gekcACd8awablp5XTaa4deIPLvcJ/TfjSekQMe7+1e3I=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kaM07Xa6/jgsfBLWGL2sfcnf/qpxGsTLB620BgwplLOpA==</Encrypted>]]>
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
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWAh8JTZcziZCG2on2ZWLl439b+vSq+OnSYZFzdng1hLp+JQfVx5HW5IwgFXUCaddVzUWBJhRU7zaHE7Vo9KzZkpjj+5CR6dSpzXLprmJhdDyb26HohZ7hmMsBUMMXW0mDmEc8UrJbt5ClTfLlaoN0d/uoUW1ud759/uJP8JSTiz0TfdPTIOsrlcYZCMg+6x5AFr9HWThsdkUy3TkXbJyItk84xylISRWoXZbshnRi+xWM6tGkNuwkCkOhvlVIFJkDJ+LwzSJLBFRjq1yx46XrR4waG3b/PjScjMw+6bqam9s8yO9oyKM5ovC8yAwfO+h7moFaqJ5pS4K/jWrz5KqRNbn40nmYlCX8Xq4V+JexdWP1Wt3SKkywGd4fCDLGJlR9lm7nr6fXSpuhAEj0/e7bjlkxbC/oOQ5jM6OQPR4N+5Kp0RqotE/EVJOWvhCoFHunCgXruVIMuBl3SzO1QUOiiUcFFyv1Clz4MadBvO+BPoqYCm8GnsPwte64+D6NqcbMtdYdzgwWGFmR06C67KIxDK7TSONJG1XR0jB6o0U7CBimlG4dATLojzHvJR2AM2f2O8B4Qb28YaNx70Fc+4GkpR8bsYv/8fmivhHKyWMGuNl43Vv/UUpJTy6ZfHjgl08lNeVe1C919diu/zOQaBUX6V19Cwsz2SP9Zq58F4W5tWKaHiu27B5Vs5pItoLK22EkN/8OpiVFoKOvTve7qfqU2MBhp8OcMuXRTUQRUc+j6hjMvkEnx7d8c1KMnq3eMT4dbpeHisFMlc+IIAOJzsH94=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>