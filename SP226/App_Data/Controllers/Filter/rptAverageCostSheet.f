<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptAverageCostSheet">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="thang" type="Decimal" dataFormatString="#0" allowNulls="false" aliasName="toPeriod" defaultValue="(new Date()).getMonth() + 1">
      <header v="Tháng" e="Month"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="toYear" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site Code"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1" />
    </field>
    <field name="ten_kho%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nh">
      <header v="Nhóm kho" e="Site Group"/>
      <items style="AutoComplete" controller="SiteGroup" reference="ten_nhom%l" key="status = '1'" check="1 = 1" />
    </field>
    <field name="ten_nhom%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt">
      <header v="Mã vật tư" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt">
      <header v="Nhóm vật tư" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_vt2">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_vt3">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="view" readOnly="true" hidden="true" clientDefault="0"></field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 20, 10, 10, 10, 50, 100, 100, 130, 0"/>
      <item value="1100------: [thang].Label, [thang]"/>
      <item value="1100------: [nam].Label, [nam]"/>
      <item value="1100001000: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="1100001000: [ma_nh].Label, [ma_nh], [ten_nhom%l]"/>
      <item value="1100001000: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="110000111-: [nh_vt].Label, [nh_vt], [nh_vt2], [nh_vt3], [view]"/>
      <item value="11000000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2cTOXqxhyK92H6Zq0t9Zin1f/RVV41p4Kn1LJ8i8HsQBVaD/TYI6+CR78FBOwubNpfcyU2ZfC4XAt7gH1/QuBv2KHENl1MqyEgfsYZ7Sfu/FHtOKLvMoL4lx2DNT0r6Vq/mt0d7G2jBUXBvrMWyJwIzVmZx83Qcw+Z3ulF2caBHBoSkxoNCtL1TFHxvjNf06LGaViQcxITTvZAUdw3+HIPNobqdvorunbdJPMrvuT+DXX6y9CV6UQ/cG5n3VTW6YJ4WKopMXwcAaHoC/PKIBqA=</Encrypted>]]>
      </text>
    </command>
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6CaZtOn54XiEP5ngZJ6In/+zKYTwJapdfMvxkL8+xQqtpWPyJblYlVoZ9pBd2oPWQbaIgayw1Babof/As4uy7KHBURKuBvoFYit1hrRJuFlgMkFX5AY69nVcxabieQhCqswZ7BywaNSG3ePaXnYfb4p6dXR9nIAEUo6GTdCXC7odyLO+TNzipCVM+96+SmeX1plI3cvwbttla/HTdcvPpUuqd2NCS5vvsijylQzvE97oEPgmWyCCF56fWjfv0PAlQkuImkpUE2Ssx6FyuzGJoolarQ39shKj1gkRCTVwUH7YB3CNJt0VkT0UftdFhi/TY04V3GjJY8uAel8HfEKB+4YvXqelEY7obull18foMgQ</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdKODyaIhs4qaxXba3Pp4inJC3z9sKoyrd6FEN5noWIaC3tq7uTLEZw60j9hFM4NhzrlLB/sw8jzd4Gh6C4uLn0UJyvJsh8NbXOmcwYd9ODcw6QIgogC1fZceUrd7WAIKYapVk1Qsup31rul3pVYueyb83bMBZmfq3z0krclev4hGeKK9bbs/J9R8sPK7zgJ4fhmlpADvglIolMbuzFkKYJcRyAZ7VHNzn9tCSSF+xKX5xsCXHqyTcHqKWhd/TFVls5Dl1ocUaYkm9bSvy+sl2BDGwSnWvLQr4ElgneB60wcIdGCYcs4hULajFnulk6wUFVUKlzhfwELX8dwuBM8nYjWE1cjiVy0SZY4ZRedJNc/Bv5ggLI33dxJIF57PCpr/NevguEUzXdlF3ZxA1BDajHpqhepfVsAXLYicbcmvuUAaK18Df9BW4Sy2pn6ZFHk2S8OWWzpS6eRpudQaqfz8HxzAtE3mPxK/SZdZdWL77WAIQi/+n7Muvdry76w+4qBsEI7FcZYoF2iJ1lrRMdEJKV61sTr7YuvYl+nTnd/iMfphGDK0MMYP65559AD4m7aeR88XezAg9Bncu+70+sdEZlBkTsrC0mCkjlzY1+Lq1GxMF6qJbcx8+Czcz7ORpJLuW0NlOLYS/OqcHJzL64xyiL5qKHPWtxpTjUP4jZ8Xeo7cOyQeO769RKXQJ9+wcFIofTda1tPvQmrB+MNVpEirSOIRL5sGrXx/IN0vcyRxbuVweQoyEszwKno+vnEnNwfmXLhXGJGYa8h+2OalTVJRnrpRBHhgANnA85Q9mX6hpHtIylTpmfUOpdrzCxXOsJo9AcODRg40aEza40cnvyyeaynYHMpja4zQ9KWyS2+V5Q8VQ+6YaQH2D2V6RqvEzAtt28+vW/nHbmL3Qy91oP7ldXt562N2p4hJ95OjfB/X9JeRbIdTa+gKpDcBTuU12F9TxLlAa1obq4NHz/VeJOjxJFBLGGVymmcOucozEm9rIuHVIuGS8Sh6gMnAvevJ/GcfuQ==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>