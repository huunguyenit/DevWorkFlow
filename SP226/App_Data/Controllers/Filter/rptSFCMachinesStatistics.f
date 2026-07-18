<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptStockBalance">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="so_ct1" align="right" dataFormatString="@upperCaseFormat">
      <header v="Chứng từ từ/đến số" e="Voucher No. from/to"/>
      <items style="Mask"/>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat">
      <header v="" e=""/>
      <items style="Mask"/>
    </field>
    <field name="ma_ca">
      <header v="Ca" e="Working Shift"></header>
      <items style="AutoComplete" controller="SFCWorkingShift" reference="ten_ca%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_px">
      <header v="Phân xưởng" e="Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_px%l" key="1 = 1" check="1 = 1"/>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lsx">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsx%l" key="status &lt;&gt; '0'&VoucherLogStatusKeyLookup;" check="status &lt;&gt; '0'&VoucherLogStatusKeyLookup;"/>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_cd">
      <header v="Công đoạn" e="Operation"></header>
      <items style="AutoComplete" controller="SFCOperationList" reference="ten_cd%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_cd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_gd">
      <header v="Giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="type = 'S' and ((ma_ct = 'SF1' and loai_ct in ('02', '04')) or (ma_ct = 'SF6' and loai_ct in ('01', '06', '10'))) and status = '1'" check="type = 'S' and ma_ct = 'SF1' and ((ma_ct = 'SF1' and loai_ct in ('02', '04')) or (ma_ct = 'SF6' and loai_ct in ('01', '06', '10')))"/>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="mau_bc" external="true">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="162">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101--: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1101--1: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="110100: [ma_ca].Label, [ma_ca], [ten_ca%l]"/>
      <item value="110100: [ma_px].Label, [ma_px], [ten_px%l]"/>
      <item value="110100: [ma_lsx].Label, [ma_lsx], [ten_lsx%l]"/>
      <item value="110100: [ma_cd].Label, [ma_cd], [ten_cd%l]"/>
      <item value="110100: [ma_gd].Label, [ma_gd], [ten_gd%l]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>

    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDBaaV766j4XqVMPTsxBNLQww3q08fuNcQISGpOyZtsSlqM4jcsZWivfG60vkKufBEJGSlnksyOdWTCoflgLXgQSD/ZAdGaLn344gzm40OBIYN4UmLbGVY58vai5w0tbYQF2oWn2/ie7mh7r6qvIltgi/MCQpDOwq+MYlcsdqi8xkSvl+xGN06R35nd8UOpxd1wkJka/dimHZNhEFPbSAtPPbut4KFvbloSWIuk8jPEag8ehXqkxP0cCMXk9dIErVA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKwcL4fHJYjbClncl285aR1NeKQrGRuiCmEKXhD6Tkzn2HXn2xsJsRPxRAKP1+2oMWlsxExuYpxyL4ido4TsbcV0SkG8fIhoDR0u12R0D5ilnTx9a59wHvagse/saQGUgI3QcSwGhWZ9yvEssuKrvmGE+Gve/upToOyGCqxOLAbz8e4Ftu1G68kk9lIoAsAlzP4n5WldzDDUNetlbeXhLUNgG8IeV3670OYBh6h4JaeUwsd8mWAP1o0jGSJ3IeKtRMd4pSOHd6gAhSaLFQKnT80DSlBRQGIxRCXZApokxVNN4Q==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>