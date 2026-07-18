<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu từ" e="Counting Date from"></header>
      <footer v="Ngày yêu cầu từ/đến" e="Counting Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu đến" e="Counting Date to"></header>
    </field>
    <field name="so_ct" align="right" allowNulls="false">
      <header v="Số yêu cầu" e="Voucher No."></header>
      <items style="AutoComplete" controller="StocktakingRequisition" key="(ngay_ct between @d1 and @d2)" check="(ngay_ct between @d1 and @d2)"/>
    </field>
    <field name="dien_giai" readOnly="true" defaultValue="''" external="true">
      <header v="" e=""></header>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu nội bộ" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Khác" e="Other"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="126">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="110100: [so_ct].Label, [so_ct], [dien_giai]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLGAcrbSHV0QghmmHqbU0e0ATRvCYJ+dr7JGeZLHaHdC2xdPJ8VFk78F53bgQUGkLwTqksIO/xRDTv5n2JBmQvULwfTEGqB8g5Jtqy94NSb7</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8KU3qC26YeKeL7edhfPrfpgZONKdU1UPWxvzyV+vn9pV8AMouFBAF6ZfFNjB8xB1ohB+NYLwmZGVZnGJWnlC/76UTkVbduA498XuwQbi0hfyNG0g2bY1l82bOhgJWurQKQP7gg0QoOyYZzvE89H4UJezzSRrNjLmJcoptNUX/e1vNYGIJ8u0hMlEvo5z6fffg==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5B2ARh+M1OAT8p75lJ0BBgqhKM+ogaIyRRtI58CGHEr1Snd5Bji4JokE1QNM4naisRYZzUbrE99fhrZzD7R0gbihBWlqdybRz7r6ixCPcRN3bEb1Bt33sU5cBJijLlj/iHU5lsS+CMHa6zoNeYiB0M/czmJb24/tu+8k+44dAA6sDd4/w/Ck8D6CAHotGqPJ6x1izDV09U40q1jTOPz/OD06dnPMLoQqv9h1qz7onDEMWmTffHU6Ru/S/MINEzqY7aFbCwUDSs6UYmcju4aYRuddAwOezmXXosgSKDt+SEhr8gfIX49HWZw2cMRcSd9+Y86D4aWp6QGVJCmI76U9Qhu/wtn9D5KgSyzJhNmOk5+rDgIxp/QfqN0Vw1407XwQy37KaK7ydvMxe9qRITfU+jgccbIrm86pBsjcBFwgey+</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUyBDhZdB6fkZIZSLuTUcxyUjHwrYhqt2v/8B8rg0TMUjATgW6R5aeYuMMXaL7xyCet1LcTm4csVwr9Y1V7BUx9hQQC8E75So46XAmMGVvpKgg9r+WFE3iFSvp0ZwUVRyITJUYDrn0/BuSVU+5HFUuvp0WvkPyFdc4ryhNM/Lkc7MdC2XsuJCAZnqTbKJdEAxniKSjkJcJWsFXax/CCnGCkCPiClcP6CyMDhJC22vA0obNOzxrRfS7JqeV4w+heN7fJ7xiLH19hqGG8YI2N6cGkoqdq+SyHwsf2Lo9XCse32jdTt7U2r+u2GSYHefQbFMJ8Qmf8oaRilpaXJTYNOl6us1g12GuUP2sWNIUn/X2nFlQUKBtQvNmyS0bcY1cCKmmoAlMtaba8PwF3gS+fmY7rfAu32KWT8m95S8+6QHIkDU05t5hL15kdQT0ia4Nx8K5WgY9nF433eht7CeH0KKavLQ4C6x0dnnFjMGPaK6nFHVQP/pKM7Vm4K7OqDok28rq667+DcaS/E6U7hCD+qMi5Pye6igGIgIZkWMJDEG3IAdSXUqEQNfvjA+Wyuyhs9cI2dIl8IIv1ApjNwMl82xQjDf8a6GX6es9HG+tVyR/l+ePMOCBdqhWwvrtA4kYFjE8q9rcXgsJhJUkh17UYJDNwIVhMaA+Nf66lLA0dnI57S64FvcPhsImahHDFTnDX8l64yuLvh1AcTOF0VE2zt1Y6J61rw5mM7WXfDa5VGiBC85+4Mixw6lY3/cS4g43MMvut3ZBj1MuTrO9OqTu4tQd2IBy1LAe6EzJx+Q/l3/w03</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>