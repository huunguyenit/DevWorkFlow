<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo tình trạng hóa đơn" e="Invoice Status Report"></title>
  <subTitle v="Ngày hóa đơn từ %d1 đến %d2, chứng từ %s1 - %s2..." e="Date from %d1 to %d2, Voucher %s1 - %s2..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="80" align="right" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowSorting="true" allowFilter="true">
      <header v="Số hóa đơn" e="Voucher Number"></header>
    </field>
    <field name="so_ct_hddt" width="80" align="right" allowSorting="true" allowFilter="true">
      <header v="Số xác thực" e="Reference Number"></header>
    </field>
    <field name="so_seri_hddt" width="80" clientDefault="Default" dataFormatString="@upperCaseFormat" allowNulls="false" align="right" allowSorting="true" allowFilter="true">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="mau_hddt" width="80" clientDefault="Default" dataFormatString="@upperCaseFormat" allowNulls="false" align="right" allowSorting="true" allowFilter="true">
      <header v="Mẫu số" e="Form"></header>
    </field>
    <field name="ma_kh" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" external="true" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;" aggregate="Sum">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="80" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="tinh_trang" width="150" allowSorting="true" allowFilter="true">
      <header v="Trạng thái" e="Status"></header>
    </field>
    <field name="thanh_toan" width="150" allowSorting="true" allowFilter="true">
      <header v="Tình trạng thanh toán" e="Payment Status"></header>
    </field>
    <field name="datetime2" type="DateTime" dataFormatString="dd/MM/yyyy HH:mm" width="120" allowSorting="true" allowFilter="&GridReportAllowFilter.Column;">
      <header v="Ngày cập nhật" e="Updated Date" />
    </field>
    <field name="u2" width="100" allowFilter="&GridReportAllowFilter.Column;" allowSorting="true">
      <header v="Người cập nhật" e="Updated By" />
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="tinh_trang_hddt" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="hash" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ph" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_bi_mat" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="so_ct_hddt"/>
      <field name="so_seri_hddt"/>
      <field name="mau_hddt"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="tien_nt"/>
      <field name="ma_nt"/>
      <field name="stt_rec"/>
      <field name="ma_ct"/>
      <field name="tinh_trang"/>
      <field name="thanh_toan"/>
      <field name="datetime2"/>
      <field name="u2"/>
      <field name="tinh_trang_hddt"/>
      <field name="hash"/>
      <field name="ngay_ph"/>
      <field name="so_bi_mat"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCUQagP8WN93u6v9P7BZGiS9lX+KO/ofDEyUKlrpV/SBOFV5y3pmTwH7pDP3oJSZNXlx5ZZwROffftKK0DX/HaR32xLDWCNjfoBcdNazh0TjfDGGrHNbaYAJLV/F1RbxpMKr4a/JOIFDzfWSNQNp/i9ScoUuz4iPYklc0Zd2IZwlBd+AIiQC12NQZBXseZfOaAAUerYCsRlhQVmMAJIm8Tq+VOqdP4WiImwy81Z9gD40</Encrypted>]]>
      </text>
    </command>

    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetSupplier">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyGeIm7vIYPzzsye1BH/y+l11hJ1/UpES4pfkMf1VQqFZLl9Eyg/WG0VDVUk9ifiaNyB96M5H2Q5buqbCFxV5tNs8Mq3ODfrCcKMcp3mfyKlNvwXaOpPXa2CZtt+IWO5h7kmEL0tToGtaMwqnS9J2Js82mR3BIKajoJCahd5AS+hnKg+x1R30/vIglwjvZcUHDEiOsfWM7ADyE2vvubLOuOBxbDh6/wniCQ3Cusn9P+C6pSRvR4vc2u+hwga/4mMZ1MSPhAYdPEGtQhXiH9s0cnQa6n5BEut75JzQt00+/bv6rTGSq3oyIAGZ/C6AZwt3geTJ+eEXHXmZv8Ee8vW4q6HLTBEI2cnPuQGgF0/yndxK/gI9KiqUmPIJ1I99IcknfFgZUevYEVUmuL3v8mpJk97V274jCq7wicjD736xd44rnM+TOrakqUfZ4B6r3CHwA+b4j+hlm2OWUWUJRJ8EeVZ2nCo4T3lk+1BP1Vqq+KOwCSubps95tr9JO6OQ9/m5DU7QI9cQbhXr/1Vc2226BS/egMx7lOz5szN9RqqvoCUmyDcoVa4L5vKKGarQQhVuRjs26nGdbUU3VG6Fi6UCrk=</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5js3bTC/vLZLgAKFFn4J+h+PjYmngirR+QvHN2MB8LydqbDpn8Yy+YPft0E08+4JeIm/Ba39ZCpmMnPrRE14FsmQfVfeRawM/fb1/W1XkR9/Qp6V8Fycy8QgZgcutCMPFCKgR3SWXuhLWa0fj1U9OuzV9p0o5VpHrp+d1h8MtQpzO6utHC9akxyXW+zaylAn2Tlw6R5eoFTLb/fefxbeXLGxNvZCPJ8/bKNHZ5gWi+zvaE5TbepSOCs9WUoMOgsLA==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Resend">
      <title v="Gửi lại thông tin qua thư điện tử (Email)$Gửi lại thông tin...$150" e="Resend notify email$Resend$150"></title>
      <menuItems>
        <menuItem commandArgument="10">
          <header v="Gửi lại thông tin qua thư điện tử (Email)" e="Resend notify to primary email address"/>
        </menuItem>
        <menuItem commandArgument="21">
          <header v="-"  e="-"/>
        </menuItem>
        <menuItem commandArgument="30">
          <header v="Thay đổi thông tin thư điện tử (Email)" e="Send notify to alternative email address"/>
        </menuItem>
      </menuItems>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Convert">
      <title v="Chuyển đổi hóa đơn...$$90" e="Convert...$$75"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>