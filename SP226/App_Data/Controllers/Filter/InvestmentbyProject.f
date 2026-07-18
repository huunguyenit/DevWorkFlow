<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A04195\ReportCircularTypeField.xml">
]>

<dir table="dtmaubc" code="ma_dt" order="ma_dt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    &ReportCircularTypeField;
  </fields>
  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130"/>
      <item value="110--:   [chon_tt].Label, [chon_tt]"/>
    </view>
  </views>
  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>
  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYBPjBKeM8/Qt3MheupAycbm2zTTGGEZMyjhaXuza8xtfNP+tzkDohuq0TAcU7gr8RVqkCpb121b+8FTT9NRuhZB8vb3SAlo1x9A09tpdTnXutAKYkJXZ2QEF4VubwDFVrOFAQu3gF6enIMNDmCPzvLVm7hqvM0w4GMsLhbA1EcJfy783hmpvhBS5skyqVMDe/o4wx9BK+i+68E3Y7anXqfNkJ03b6DenbmaqapyEfu2XPiPOLTR3MFpiW36dMCPYYZV0bUXunQycADIcYZL4uZ2+Kpb3ameT2uXkC8jPcVu6q/torQwkKet21w9xqxHrqmGna81HijJyNTIjgU38dUysoKnmZ3FSfIA69kLGu5qk6QQA82LUlVFDH8U8VnCTLdrZWTnqJFrOq0gf6X4lSiYpTfI5y2PJWSnLjYCOGCSu7sosA0vbFOM4YD8/FqX0iK1chBa3OmdSM7LeLTGdYPfh28Gsux2sqlVmGrv72wsXquI0bXD8VAatupgFTwfZrZUQIXauRmPm76rRVDbAYqA==</encrypted>]]>
    </text>
  </script>
  &OutlineCss;
</dir>