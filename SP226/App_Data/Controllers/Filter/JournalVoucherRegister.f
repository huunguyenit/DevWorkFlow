<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
]>

<dir table="ctgs" code="nam, so_ctgs" order="ngay_ctgs, so_ctgs, tk" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Đăng ký số chứng từ ghi sổ" e="Journal Voucher Register"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày ctgs từ" e="JV Date from"/>
      <footer v="Ngày ctgs từ/đến" e="JV Date from/to"/>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày ctgs đến" e="JV Date to"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit(s)"></header>
      <items style="Lookup" controller="Unit" key="ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.r_access=1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights r where r.user_id = @@userID and r.r_access=1)"/>
    </field>
    <field name="copy" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Sao chép số liệu" e="Copy"></header>
      <footer v="1 - Sao chép chứng từ ghi sổ sang kỳ sau, 0 - Không" e="1 - Copy Journal Voucher Register To Next Period, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZV9WwVZQWsaFWDlw/EfkyODdhY7VTSgbmUlJWVM/YAsWzE2xmDFifocuRtFH6baGhw==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct3" type="DateTime" dataFormatString="@datetimeFormat" align="left" filterSource="Optional">
      <header v="Ngày ctgs từ" e="JV Date from"/>
      <footer v="Chép ngày ctgs từ/đến" e="Date from/to"/>
    </field>
    <field name="ngay_ct4" type="DateTime" dataFormatString="@datetimeFormat" align="left" filterSource="Optional">
      <header v="Ngày ctgs đến" e="JV Date to"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11100: [copy].Label, [copy], [copy].Description"/>
      <item value="1101: [ngay_ct3].Description, [ngay_ct3], [ngay_ct4]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf92TVcb0trT1lVo/dSDzMPHmyFXt1QXivvxbPkXO6FjDtiZJsA0AeEbwm1064yBl/im36UIz22tQppqLUXtoAnW9+ZK/6Gg1ruN0xizY35R7</encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9+YS+wrn1iJryFiLwpW//81tcl5ydqHKnWCs6P2ijDafRbOYjlvFs7gY/7e7QQbXREalZKVbQuLvTKXqQHPYCM=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBZ6BzPonTyq1dLDhtA6QszE7aoypIsUqjgvE2qA3HdcQUn4vlTLqb7d8SDMIwsCqZUt9As/PnIYJtmXo4nkI8r8zpj9FETwttw86azhCd66V+5pIADcPZ2y4YUE1D2l7d9qUl7YQXI8HCLYdooz+ln/2qF72jL7TiyCK8gxtLNMGRVEejfXTElYBeBsQ4fsH6kax2xCOm4bdwV+FpFJ0XutpeZdx3PC2eSdhhaO9kuTL3WxK8JfmZ41uOHMdlOuYmFbSa8mvVq/VBjtO2XyL77MUozStVi+HjoExk5n1z+PxA6uoFoPfDqVfnzk6scvq3GxPcXU5N5jNwMFIfeVTp6zvKCvSYWt55rIuMOkQHRUQiyfz6Ce4+Msn03l+Higsx44CB1OqzR6Dic+fiAectiCHisQSpx2GVPxnrj0qkVu0+3HI+C9mZWz53G9te8J+0BMIdyIrEg2lc9HeNUUiajg6hbrj/tpeasaKsG2+TXHkbIUVnMZoUjBlQNxyzEztPOVShVyY0z03tkf1y9Ul/6uS7K3OOQKyn4Om4dkb7D4YT8TI9B3RqT4juk5JpPKiZ+ejF4zqWZnO4/cQvpYTsYcTEN1kHdtSB2vYzcm3+6OMr8vGga8IhachsDuL/KIeIVXXfXt4M1aqyxfz3YNc6GeleZCDA+0s/UO0GUGzT9yP85NeQaAx8XmVlrRpOlW4ujSO29fipzxq9Zkr97gHzlIIVrWRhJl0eiN0XNhu/GjLvizOc3bq1DTmVMvTppnIpoqJoa+X4G2qQ1MkUdfFKChJPDOJMb2PKfc4upwDeIwW11fpcvZFsUeLDVPxLE0rtJqhPDeP3Vn/BLaHXKgLYBdKm2GGHfFXCQZumhF0rokVsrw9YV4H6YyGStieCvRD0LOMKCIoHuuhnTZNmYvICidcMCOM/rAJvVs8eFoOJ8t+w==</encrypted>]]>
    </text>
  </script>

</dir>