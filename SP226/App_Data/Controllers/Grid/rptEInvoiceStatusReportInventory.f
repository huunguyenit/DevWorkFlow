<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo tình trạng xác thực chứng từ" e="Voucher Status Report"></title>
  <subTitle v="Ngày chứng từ từ %d1 đến %d2, chứng từ %s1 - %s2..." e="Date from %d1 to %d2, Voucher %s1 - %s2..."></subTitle>
  <fields>
    <field name="ma_dvcs" width="100" allowSorting="true" allowFilter="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="so_ct" width="80" align="right" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowSorting="true" allowFilter="true">
      <header v="Số chứng từ" e="Voucher Number"></header>
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
      <title v="Chuyển đổi chứng từ...$$90" e="Convert...$$75"></title>
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