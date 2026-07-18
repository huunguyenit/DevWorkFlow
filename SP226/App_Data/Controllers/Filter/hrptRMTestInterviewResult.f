<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="date_from" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="date_to" allowNulls="false" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_dot">
      <header v="Đợt tuyển dụng" e="Recruitment Period"></header>
      <items style="AutoComplete" controller="hrRMPeriodInfoInput" reference="ten_dot%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dot%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_uv">
      <header v="Mã ứng viên" e="Applicant"></header>
      <items style="AutoComplete" controller="hrRMApplicantProfileInput" reference="ten_uv" key="1 = 1" check="1 = 1"/>
    </field>
    <field name="ten_uv" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="vtr_ut" onDemand="true">
      <header v="Vị trí" e="Vacancy"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr_ut%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vtr_ut%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vong">
      <header v="Vòng tuyển dụng" e="Recruitment Round"></header>
      <items style="AutoComplete" controller="hrRMRoundExamination" reference="ten_vong%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vong%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_tt" dataFormatString="1, 2, 3" clientDefault="3" align="right">
      <header v="Loại thi tuyển" e="Category"></header>
      <footer v="1 - Kiểm tra, 2 - Phỏng vấn, 3 - Cả hai" e="1 - Test, 2 - Interview, 3 - Both"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99H1Jhc5Ptu84GiakQqIGp8WhtgaHMB9jW24u5qZFBJ7J</Encrypted>]]></clientScript>
    </field>
    <field name="ma_ktr">
      <header v="Loại kiểm tra" e="Test"></header>
      <items style="AutoComplete" controller="hrRMTest" reference="ten_ktr%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_ktr%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_pv">
      <header v="Loại phỏng vấn" e="Interview"></header>
      <items style="AutoComplete" controller="hrRMInterview" reference="ten_pv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_pv%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tt_hs">
      <header v="Trạng thái hồ sơ" e="Status"></header>
      <items style="AutoComplete" controller="hrRMAppFormStatus" reference="ten_tt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="kieu_bc" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Chi tiết theo vòng tuyển dụng, 2 - Chi tiết theo nội dung kiểm tra" e="1 - By Recuitment Round, 2 - By Test Content"></footer>
      <items style="Mask"/>
    </field>
    <field name="mau_bc" clientDefault="10" external="true">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [date_from].Description, [date_from], [date_to]"/>
      <item value="110100: [ma_dot].Label, [ma_dot], [ten_dot%l]"/>
      <item value="110100: [ma_uv].Label, [ma_uv], [ten_uv]"/>
      <item value="110100: [vtr_ut].Label, [vtr_ut], [ten_vtr_ut%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_vong].Label, [ma_vong], [ten_vong%l]"/>
      <item value="111000: [loai_tt].Label, [loai_tt], [loai_tt].Description"/>
      <item value="110100: [ma_ktr].Label, [ma_ktr], [ten_ktr%l]"/>
      <item value="110100: [ma_pv].Label, [ma_pv], [ten_pv%l]"/>
      <item value="110100: [tt_hs].Label, [tt_hs], [ten_tt%l]"/>
      <item value="111000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKK1BRPJgsUqzblUsPyGwOfExZ33TM/SCIg1uNlHGL9BQzZMYjhOv/WIedRMKd7D+BJeLRfXZoCC8hWbLCaFdzHqvKvIEwi5Tsa4hNLMf6BWlTM74TiJomFDoNsN6w3OhMCxs3x4Qill+d8vEbn6/qXaiVl+Kq7VBOaHzCfSl7t4TBFADCD63QUGudquwVOr8as+WM1TOyX/DExsN4b2QdqmFydvlDQzElocBYEgp5X0J7ZGGEjpiiVsrBvGRc/dZQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdJRNu5zlk9LulV4hGWKSokzACh9aJhZjgnn7aLDw8xdKq8fhICiN2Tob2krMvbdZ46ETazqdI7jrQbDwg96UVqF5JkuuGb2sODW+wdrkZSqPb+Uxs1TzW1hwv3HFI3hXk4KkmjrjwrcswZD/J8pm17aQPNhJ5gGVDoUr0pDd43TxPSATkOuujO9B9409IVGKv38Pcl8v5817FFnKeoClx6gaMaP0LGzXg74UJfKnaborHiRNQvm8fw/3JkaYDmcgLCGpl29NbLeuwW/Ud+YNYdIVy4PGDUT0ESdwBDOJLnozd3Zkvqc/GolZpuwCqBkeHYHGZKQ31NZM2g2H1Mf5E6qbCbNNZJSW42G6EpVIwKz7LLPxuVhyNT2WdoxCp0PF9UQ/JYvz4A4Pyj3hXrsYO5d2MW0ZSIXY/3wPWqhGgdPyY3zjGXGHyA1fFisvzub3jHhELhrGyNG/v0zB7/ZZOfU3mV1YsYoBaYNRP8Que8jVwuGQPphNnZVChPlYb/WI8mk+mbEWxKZLN8H9pwTKL8xTYgjHfxEyjVV9sTna4hEpjkPdyNq4X8IBWahDYxZGKgzP9Qb3k1tkDV5zoV/Z1MdpmAFREz1QTXuG8e2GROpn4I/qPdqoIawqKl0833RlX5IaFg1ZgIjbWG2ahRvJCrp3W6L0iD6Ao2Rd4QI8LcRgGDnk1/958MWnvE4XphVZGOvKL43iO7Z99/mq8N6XFXQPhOel5HP2p5DR7N++hZfJ3cqKnEbIi01IktYGcp/wnXoYPweRMm7CN6NkF2jMLUOeG/f5yExtOgdO/xjGRnCq9jmpduvEMu7LHKRr5QCEr7kAjWRaJkoq4QJj1yF5ykFKQ40N28ZoYFtk1CcgOQ5V8q2uzbKvwqJTPj2EdfVNasqyyqdCJvAEHJDWT7QJw1qn9Z2PKH4PIQGjXhNvY/rx0TNlIbNsZ3Hm9JdzyqSSNg==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>