<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày từ" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="ngay2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày đến" e="Date to"></header>
    </field>
    <field name="ma_ct" allowNulls="false">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="Lookup" controller="Voucher" key="(ma_ct in (select ma_ct from dmct where m_phdbf not in ('PHDM', 'PHRT', 'PHWO', 'PHSF', 'PHNL') ) and ma_ct in (select distinct ma_ct from Voucher where kt_yn = '1')) and wedition &lt;&gt; '9' and status = '1'" check="(ma_ct in (select ma_ct from dmct where m_phdbf not in ('PHDM', 'PHRT', 'PHWO', 'PHSF', 'PHNL') ) and ma_ct in (select distinct ma_ct from Voucher where kt_yn = '1')) and wedition &lt;&gt; '9'"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="tuy_chon" dataFormatString="*, 1, 2" clientDefault="1" align="right">
      <header v="Tùy chọn" e="Options"></header>
      <footer v="1 - Không kết chuyển, 2 - Kết chuyển sai, * - Cả hai" e="1 - UnPost, 2 - Wrong Post, * - Both"/>
      <items style="Mask"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 100, 100, 130"/>
      <item value="1101-: [ngay1].Description, [ngay1], [ngay2]"/>
      <item value="11000-: [ma_ct].Label, [ma_ct]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11100: [tuy_chon].Label, [tuy_chon], [tuy_chon].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Ks8tRCiEjLIaMzz1Of9p1ydiPTlJL3htRQ3BD8xr3hhGgpHLloWdJ6hy5a79mdpjJsRW7MVjDW5YZWrAlkK55HZF1LVRY+damxiOo3DiOBch1H5bdNyB+a1PI5IGeDCkt+9nloXTKsTDVEckCxsXoik=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+SpeCuq5ic4WMUrthGm0QpG58M8j4M/exu0F3QaxJyg4SWzyIhg5CPEagHXg+u5E1YSBBQR5MaUbEH+vH7xUCNBQforSefOuTng0UKyOlfsvpSrzQ/4nVrg88a+znIgdorkMg4PwFkClBoaIgtr8ojd84IVWm+SUSKQl+Fa27qdCVQuYguxfyVCkxFYvdQz5gpk74ICksrVwIqUrB+ECLjlVRJxPDO0SjZkY8isYvOd7wLvKfi4XJBi/JvTpBONzWg+HSAhwAHEap7C6rxFIVWuQM0ZePPg2qnaIPu6CVwYY756YNPZI/xNV/kCEo2QqzTMk3o9mpSBWNhMorCPXZnNnLdpZQVKz5NZhS3S1l2zcMsjcG/DHn625JAQHBOEfg=</encrypted>]]>
    </text>
  </script>
  &OutlineCss;
</dir>