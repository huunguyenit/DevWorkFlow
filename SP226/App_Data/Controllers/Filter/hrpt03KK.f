<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A0592\ReportCircularTypeField.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="thang" type="Int16" dataFormatString="#0">
      <header v="Tháng" e="Month"/>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PdsIcPP2rG4l3ZaCtXNtL8+Q9Q4sfazKIbKVREcNP7wNjZJEBsGcMebog9WGkcF+Q==</Encrypted>]]></clientScript>
    </field>
    <field name="quy" dataFormatString="0, 1, 2, 3, 4" clientDefault="Default" defaultValue="0" align="right" maxLength="1">
      <header v="Quý" e="Quarter"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PdsIcPP2rG4l3ZaCtXNtL8+Q9Q4sfazKIbKVREcNP7wNjZJEBsGcMebog9WGkcF+Q==</Encrypted>]]></clientScript>
    </field>
    <field name="nam" type="Int16" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="bo_sung" type="Int16" dataFormatString="##0">
      <header v="Lần bổ sung" e="Additional Times"/>
      <items style="Numeric"></items>
    </field>
    <field name="ma_bp" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    &ReportCircularTypeField;
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130"/>
      <item value="11: [thang].Label, [thang]"/>
      <item value="11: [quy].Label, [quy]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11: [bo_sung].Label, [bo_sung]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11000: [chon_tt].Label, [chon_tt]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu915G/uFfMhKU1mrhkb67t2ATbNpsGMJ75/0ON5FlH1AsqMLKqr4c7sc3Jl8qo8LHci7DRQUo+kVKf548Q6sShPYnxwPGyDMmQSsl5aIEJLBQzNAYxBgB03twy3gZFWvFNMVRWcclRxGcRjuT2+A+JNle7nvVvBMKaYsJMO+Z1UOqFcl/5JnCv3v9F/ue5DQ8Ik/d4r+0patRN6zo6rI6XMHDnpU18c5nVOTUGaTe/AnrBLQw8VW/iO3JHbJzBgN1J73O60baM09kxtsJpr1HJ+HS00aQzKS7nTmhVskq5xu</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkDov1cHj5PI6sEEw0XuZcC/587zZrg4TgM5lFxW5FHe8QnWHLYg2Bqj0kEQZKAVsQssyEeLvGBV0XpgPUm2BpMLXuti4oUfZrYsSzPlRw8jHEnE4X57XoG3Nj3JeoM91oobB61J1rVWZTk0s/ynb+RHRv/m2v121UgtEHqwB9hhh5qlodTub0ywwytqRWkXjRHbYIuPQ58syMJyviROud5NWze7703YvvtX6Ir1fwE4FTUYOlOgdTAJmHMrz9sULa7dL/kN9xynOkb8x665IRHgqJp05Koumbl+IDDTGYxQcw/HzI8t3gwjLExHEeZ6pM9ahcUFEeEUMMDlDAQskh5Q</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKyrIQTMT7Slu0ZC6B9TlF6yVciIbdAaw+M/G0iTBt8u1k53cwpOImEDGAWvns1KVzZHHisFFyr/HKoN+NuqflbDEiPmsrZ68SvvFjcqf34+2KvwlGukEZzUyndBCrp8H4Y27VgL5IaS/XsJOOjkxixqd+nAL0HJREqD8IX4fwWmEAZiuaikW8SgFpXrmvhduHcELY5auzb7y4pTR2oYGQYuLYgvRzRpfHL3pKZqusl4QIjJatVDjdFoT6GuqYxoavi6m7Du3X49ZAFCg9fweIycnGuwOB70SlFTKxevcs2uvZfLiV96Ur3GRmsVSBvdaXcFb0RPURNorBE4/D3T4IA11uhnAsFGVvXUrOj2s/nFbS85LNF7C8j3mwUQSiwwffrwsqsxiOUryP69x9+3ZFA/tNzfqojrRj2Uxpke51zYEqMVpLPUBwH/5hmIs/sEdmNCBhxUp2NZm+XWij/oahtJmzkBYCloeexmi8R/MCiBViK8gxQUIPaMglrcRsup5ziJ6VbmcbFKl6zxVlbHojPLooh8YWl324CqgaNxmaIUdj/p+QLOXxsVVW/jHO3y+HrUlJ6ICJQvGS7WVN8MiItK1IJlWPEKGHmh3AkivO2Q4w6kqMwzzbkyC+/HMTJDjAH52CYis/Dd/z50hn2XBfen66Lt3S61C1DqzUfa0GA00ngWfwjcXw063wm60spxKsewxxvJa3jiE85XJOVZzC1kCCpBfSnJ/j3i0icDnBMpMMYGAzCsFW7HWVAabB+2jHxXrXb3LYNHD2UXBxVKxFrXMjzWNHAdItHAMXth/adL0Ra2CVcBL/QOnHOMO0yDeoBagEuWyTqkgX2lx20bPjahtAUMT5ezCMiGMpf3mCNeNMI7dpma9wNQIGKiP8Hrf1oY6sZpDFECugHP+4J1XZsNSLxgWGD2ZOYf6LJB4GyqVWD0ZuzFKo34OFwV+8xKRUeoKtosOCdSVOLlnk34DSGB/JPf+/zPOhv38ZqwWTm/hWymZVRsRP+FSTnwEkHp3QI=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>