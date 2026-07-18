<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterInit SYSTEM "..\Include\XML\WhenFilterInit.xml">
  <!ENTITY ScriptFilterInit SYSTEM "..\Include\Javascript\FilterInit.txt">
  <!ENTITY TableDetail "ctrt">
]>

<dir table="ctrt" code="stt_rec" order="stt_rec" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Cập nhật chi tiết" e="Update Detail"></title>

  <fields>
    <field name="ma_cd" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã công đoạn" e="Operation Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_cd" allowNulls="false">
      <header v="Tên công đoạn" e="Operation Name"></header>
    </field>
    <field name="ten_cd2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="kieu_cd" allowNulls="false" categoryIndex="1">
      <header v="Kiểu công đoạn" e="Operation Style"></header>
      <items style="AutoComplete" controller="CROperationTypeList" reference="ten_kieu_cd%l" key="ma_nh = '1' and status = '1'" check="ma_nh = '1' and status = '1'" information="ma_loai$sfdmloaicd.ten_loai%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DgMtQ58Yc2oSid6Ht2Ay7ukpzIfFgJeWHxCXgcah4Yu63jMTPJw9HimFRtCAQ+ZC2+qQUW2hMogoJx32ZoOeeyI9GS5TMt3UUN74zTIclVU</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kieu_cd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cd_truoc" categoryIndex="1" dataFormatString="@upperCaseFormat">
      <header v="Công đoạn trước" e="Previous Operation"></header>
      <items style="Mask"/>
    </field>
    <field name="cd_sau" categoryIndex="1" dataFormatString="@upperCaseFormat">
      <header v="Công đoạn sau" e="Next Operation"></header>
      <items style="Mask"/>
    </field>
    <field name="ma_vt" allowNulls="false" categoryIndex="1">
      <header v="Bán thành phẩm" e="WIP"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1' and loai_vt in ('41', '51')" check="status = '1' and loai_vt in ('41', '51')" information="ma_vt$dmvt.ten_vt%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99GR4lXO+HAzGCJ530uwUqUY/L3n+fEu32+Kpowujk/QeI0hX4Hcx+6Q86Hjw0tv9X+GFqJCPMaEJa73fch/PUYs=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt2" categoryIndex="1">
      <header v="Bán t.phẩm cộng thêm" e="Extra WIP"></header>
      <items style="Lookup" controller="Item" key="status = '1' and loai_vt in ('41', '51')" check="status = '1' and loai_vt in ('41', '51')" information="ma_vt$dmvt.ten_vt%l"/>
    </field>
    <field name="dvt" allowNulls="false" categoryIndex="1" inactivate="true">
      <header v="Đơn vị tính giao dịch" e="Transaction UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '{$%c[ma_vt]}' or ma_vt ='*'" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nhieu_dvt" type="Boolean" external="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="loai_cd" allowNulls="false" categoryIndex="1">
      <header v="Loại công đoạn" e="Operation Type"></header>
      <items style="AutoComplete" controller="CROperationTypeList" reference="ten_loai_cd%l" key="ma_nh = '2' and status = '1'" check="ma_nh = '2' and status = '1'" information="ma_loai$sfdmloaicd.ten_loai%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DgMtQ58Yc2oSid6Ht2Ay7ukpzIfFgJeWHxCXgcah4Yu63jMTPJw9HimFRtCAQ+ZC9xQq4jM3abQuE5iKmVuuGxrNmPWz6V8AaLyT0lLozlp</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai_cd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ccv" categoryIndex="1" onDemand="true">
      <header v="Trung tâm công việc" e="Work Center"></header>
      <items style="AutoComplete" controller="CRWorkCenterList" reference="ten_ccv%l" key="status = '1'" check="1=1" information="ma_ccv$sfdmcumcv.ten_ccv%l"/>
    </field>
    <field name="ten_ccv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_cm" categoryIndex="1" onDemand="true">
      <header v="Cụm máy" e="Machine Center"></header>
      <items style="AutoComplete" controller="SFCMachineCenter" reference="ten_cm%l" key="status = '1'" check="1=1" information="ma_cm$sfdmcummay.ten_cm%l"/>
    </field>
    <field name="ten_cm%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tg_bd_cds" type="Decimal" dataFormatString="@HourInputFormat" align="right" categoryIndex="2">
      <header v="Thời gian b.đầu cđ sau" e="Overlap"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_bd_cds" type="Decimal" dataFormatString="@quantityInputFormat" align="right" categoryIndex="2">
      <header v="Số lượng b.đầu cđ sau" e="Send Ahead"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_cho" type="Decimal" dataFormatString="@HourInputFormat" align="right" categoryIndex="2">
      <header v="Thời gian chờ sản xuất" e="Wait Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_cai_dat" type="Decimal" dataFormatString="@HourInputFormat" align="right" categoryIndex="2">
      <header v="Thời gian cài đặt" e="Setup Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_may" type="Decimal" dataFormatString="#### ### ##0" align="right" categoryIndex="2">
      <header v="Số lượng máy" e="No. of Resource"></header>
      <items style="Numeric"/>
    </field>
    <field name="nang_suat" type="Decimal" dataFormatString="@CapacityNumberInputFormat" align="right" categoryIndex="2">
      <header v="Năng suất" e="Piece Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="cach_tinh" allowNulls="false" categoryIndex="2">
      <header v="Cách tính" e="Time Basic"></header>
      <items style="AutoComplete" controller="CRTimeBasicList" reference="ten_cach_tinh%l" key="status = '1'" check="1=1" information="cach_tinh$sfdmcachtinh.ten_cach_tinh%l"/>
    </field>
    <field name="ten_cach_tinh%l" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="tg_vs" type="Decimal" dataFormatString="@HourInputFormat" align="right" categoryIndex="2">
      <header v="Thời gian vệ sinh máy" e="Clear Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_chuyen" type="Decimal" dataFormatString="@HourInputFormat" align="right" categoryIndex="2">
      <header v="Thời gian chuyển" e="Move Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="nc_cai_dat" type="Decimal" dataFormatString="#### ### ##0" align="right" categoryIndex="2">
      <header v="Nhân công cài đặt" e="Setup Resource"></header>
      <items style="Numeric"/>
    </field>
    <field name="nc_th" type="Decimal" dataFormatString="#### ### ##0" align="right" categoryIndex="2">
      <header v="Nhân công chạy máy" e="Run Resource"></header>
      <items style="Numeric"/>
    </field>
    <field name="cc_sd" categoryIndex="2">
      <header v="Công cụ sử dụng" e="Tool Number"></header>
    </field>
    <field name="ma_kh" categoryIndex="2" onDemand="true">
      <header v="Nhà cung cấp" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1=1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="tg_gc" type="Decimal" dataFormatString="@HourInputFormat" align="right" categoryIndex="2">
      <header v="Thời gian gia công" e="Subcontract Leadtime"></header>
      <items style="Numeric"/>
    </field>
    <field name="cp_gc" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align="right" categoryIndex="2">
      <header v="Chi phí gia công" e="Subcontract Cost"></header>
      <items style="Numeric"/>
    </field>
    <field name="tl_kt" type="Decimal" dataFormatString="##0.00" align="right" categoryIndex="2">
      <header v="Tl k.thừa nvl cđ trước" e="WIP Consumption Rate"></header>
      <footer v="(%)" e="(%)"/>
      <items style="Numeric"/>
    </field>
    <field name="tl_kt2" type="Decimal" dataFormatString="##0.00" align="right" categoryIndex="2">
      <header v="Tl k.thừa btp cđ trước" e="WIP Processing Rate"></header>
      <footer v="(%)" e="(%)"/>
      <items style="Numeric"/>
    </field>

    <field name="tru_dm" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="3">
      <header v="Trừ định mức" e="Backflush"></header>
      <items style="Mask"/>
    </field>
    <field name="td_chuyen" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="3">
      <header v="Tự động chuyển" e="Auto Move"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DQix0C0a1Ph5BE/3E1IwRP0Z5xo7esCNfKzMmK2byN2NVO0bbP9NyrdhltmksXZdhgOZlHim6c6t95STsjd3vodrEbE4v5/DCmDfoegJn2p</Encrypted>]]></clientScript>
      <items style="Mask"/>
    </field>
    <field name="dung_kt" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="3">
      <header v="Dừng kiểm tra" e="Inspection Stop"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DQix0C0a1Ph5BE/3E1IwRP0Z5xo7esCNfKzMmK2byN2NVO0bbP9NyrdhltmksXZdhgOZlHim6c6t95STsjd3vodrEbE4v5/DCmDfoegJn2p</Encrypted>]]></clientScript>
      <items style="Mask"/>
    </field>
    <field name="td_phi" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="3">
      <header v="Tự động tính phí" e="Auto Charge"></header>
      <items style="Mask"/>
    </field>
    <field name="nhap_sl" dataFormatString="0, 1" clientDefault="1" align="right" categoryIndex="3">
      <header v="Nhập sản lượng" e="Count Point"></header>
      <items style="Mask"/>
    </field>
    <field name="nk_yn" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="3">
      <header v="Tự động nhập kho" e="Auto Good Receipt"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99DQix0C0a1Ph5BE/3E1IwRP0Z5xo7esCNfKzMmK2byN2NVO0bbP9NyrdhltmksXZdhgOZlHim6c6t95STsjd3vodrEbE4v5/DCmDfoegJn2p</Encrypted>]]></clientScript>
      <items style="Mask"/>
    </field>
    <field name="xk_yn" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="3">
      <header v="Tự động xuất kho" e="Auto Good Issue"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ghi_chu" categoryIndex="3">
      <header v="Ghi chú" e="Note"></header>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="280">
      <item value="120, 30, 70, 330"/>
      <item value="110-: [ma_cd].Label, [ma_cd]"/>
      <item value="1100: [ten_cd].Label, [ten_cd]"/>
      <item value="1100: [ten_cd2].Label, [ten_cd2]"/>

      <item value="11010: [kieu_cd].Label, [kieu_cd], [ten_kieu_cd%l]"/>
      <item value="110-: [cd_truoc].Label, [cd_truoc]"/>
      <item value="110-: [cd_sau].Label, [cd_sau]"/>
      <item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1100: [ma_vt2].Label, [ma_vt2]"/>
      <item value="11010: [loai_cd].Label, [loai_cd], [ten_loai_cd%l]"/>
      <item value="11010: [ma_ccv].Label, [ma_ccv], [ten_ccv%l]"/>
      <item value="11010: [ma_cm].Label, [ma_cm], [ten_cm%l]"/>
      <item value="11010: [dvt].Label, [dvt], [ten_dvt%l]"/>

      <item value="11-11: [tg_bd_cds].Label, [tg_bd_cds], [sl_bd_cds].Label, [sl_bd_cds]"/>
      <item value="11-11: [tg_cho].Label, [tg_cho], [tg_cai_dat].Label, [tg_cai_dat]"/>
      <item value="11-11: [sl_may].Label, [sl_may], [nang_suat].Label, [nang_suat]"/>
      <item value="11100: [cach_tinh].Label, [cach_tinh], [ten_cach_tinh%l]"/>
      <item value="11-11: [tg_vs].Label, [tg_vs], [tg_chuyen].Label, [tg_chuyen]"/>
      <item value="11-11: [nc_cai_dat].Label, [nc_cai_dat], [nc_th].Label, [nc_th]"/>
      <item value="11000: [cc_sd].Label, [cc_sd]"/>
      <item value="11100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11-11: [tg_gc].Label, [tg_gc], [cp_gc].Label, [cp_gc]"/>
      <item value="11100: [tl_kt].Label, [tl_kt], [tl_kt].Description"/>
      <item value="11100: [tl_kt2].Label, [tl_kt2], [tl_kt2].Description"/>

      <item value="1110: [tru_dm].Label, [tru_dm], [nk_yn].Description"/>
      <item value="1110: [td_chuyen].Label, [td_chuyen], [nk_yn].Description"/>
      <item value="1110: [dung_kt].Label, [dung_kt], [nk_yn].Description"/>
      <item value="1110: [td_phi].Label, [td_phi], [nk_yn].Description"/>
      <item value="1110: [nhap_sl].Label, [nhap_sl], [nk_yn].Description"/>
      <item value="1110: [nk_yn].Label, [nk_yn], [nk_yn].Description"/>
      <item value="1110: [xk_yn].Label, [xk_yn], [xk_yn].Description"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 200, 130">
          <header v="Thông tin chính" e="General"/>
        </category>
        <category index="2" columns="120, 100, 110, 120, 100">
          <header v="Thông tin số liệu" e="Parameter Information"/>
        </category>
        <category index="3" columns="120, 25, 75, 330">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFMpG0/FhwmfpavhryLv01IRThUlz6irg0eeFLx8tf3QrrW7WKQB1LvJ7jUL2UdC+u7MMjSZITf+ry7tmdEXawfLtUk+WybJ6S8lriTUBBP9rPH0XagLFLT7/98SU8321A==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJibWSieL8QIlPM27Hydd0SeJ0K7AxnYglcTc7UBSSIQLoF08TmRj400fH16D3c7bMyk74s3XvBq9mkWE+XTP2Y4H8BcqkHDruywFhksmHD+8NxGiUAlsBhVpB13DJrVcA==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EQ2N6Acq3v5PF2jIYMiKIwrMqywQcOkVaRTB55l21+VByZ+oTCML9zqs/M7m496nNphNSihXfjXp33Chr0S+aJpTdkI3wiounE8Qh/TsT/H45gOVoISTSthPas6mEgcgSEgvS2BA27adTZ5g8Or2XuSFqwMPHsZKqi7v85lMon5/xrqUVkF/AOiQpmxPyN8BtP0xfmFbKhkDNoUMbzqu/PLiuTFQ/5XQp4H7sgSd9C5Uey1sY9Ae1zKMUzlP+I3wu3SPl+AdCxwQCsLwmpnncmlQXr0YNDKxoXoByZWskiu/3AgwmRqUBjzN5kO4l+ZmIupMt+HB2Q50hhG8rcz6Nv2FzAAOyXSG21hOT33QjkS3i/crIQ/qyM78LdQHClPx7y5Dg4xL3tAiXSogpZnW9VHeXEGmtgyqrYkzg7OWdFD3d5dq21aqvhQXFrC9MPObuQ==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXNIu1i9vLplAyNQLu+wb4QUTjHz85T5go0iHoegrpQgsx6MBgE6nKDt9AXnIzRvH6767FKu/b2rfih1zwvVkVx0x80Qn7ohfebMTW2aoWi30BvZLBGPrmgzfQAr2sYjBQw==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>