<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A02151\ReportCircularTypeField.xml">

  <!ENTITY defaultForm "GLTHUEQTTN_28">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Từ/đến ngày" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>
    <field name="bo_sung" type="Decimal" dataFormatString="#0">
      <header v="Bổ sung lần" e="Addition times"></header>
      <items style="Numeric"/>
    </field>
    <field name="chon1" type="Boolean">
      <header v="Loại doanh nghiệp" e="Business Type"/>
      <footer v="Doanh nghiệp có quy mô nhỏ và vừa" e="Small and Medium-sized Business"></footer>
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJWE3puFMBbdPzMPkt1V6q8sYqEIcQzC9MPQtlfGzQs1FqESuH4WJGN/p3hxQUlID6A==</Encrypted>]]></clientScript>
    </field>

    <field name="temp1" aliasName="TaxBusinessType" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="chon2" type="Boolean">
      <header v="" e=""/>
      <footer v="Doanh nghiệp thuộc đối tượng kê khai thông tin giao dịch liên kết" e="Business being subject to declare information of related-party transactions"></footer>
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJWE3puFMBbdPzMPkt1V6q8sYqEIcQzC9MPQtlfGzQs1FqESuH4WJGN/p3hxQUlID6A==</Encrypted>]]></clientScript>
    </field>

    <field name="temp2" aliasName="TaxBusinessRelated" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="chon3" type="Boolean">
      <header v="" e=""/>
      <footer v="Doanh nghiệp có cơ sở sản xuất hạch toán phụ thuộc" e="Business with dependent accounting units"></footer>
      <items style="CheckBox"/>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJWE3puFMBbdPzMPkt1V6q8sYqEIcQzC9MPQtlfGzQs1FqESuH4WJGN/p3hxQUlID6A==</Encrypted>]]></clientScript>
    </field>

    <field name="temp3" aliasName="TaxBusinessDependent" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeField;

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 30, 40, 100, 100, 130"/>
      <item value="11001: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11111: [bo_sung].Label, [bo_sung], [temp1], [temp2], [temp3]"/>
      <item value="1110000: [chon1].Label, [chon1], [chon1].Description"/>
      <item value="1110000: [chon3].Label, [chon3], [chon3].Description"/>
      <item value="1110000: [chon2].Label, [chon2], [chon2].Description"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000: [chon_tt].Label, [chon_tt]"/>
      <item value="110000: [form].Label, [form]"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>

    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDQn3rKtCc97AlUK5bm5uQIgRsqCwntXP0WJGnqD/KX1yf6jhaytSurzqZp3cYgi1qhMOR+RFr1RxqqMoDaJbXwmtryCQiXj0VNE6R7IHguYtAZj/MMQU6xtNpMs8dPekKp3JMGdTArcunRzLPCSJl6k</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlptVGM6/IgfzAFrAjvmJA20WC6pmDEeh/j0i40IlAoUbCNlIIT72aMgv6Le8ewn+wysVcILc0V2oaIihBo+i+D9e</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMCcBHcMp7P4nk26g24rLvVfjyQAtvnW46n6FD29+Z5zm6gne+tDXrld+ETQlwiccKBkeyvIrfVgspEzBz5hqUNpOoYZjNIGbSOaLAuELkCNL8/sKwz0y0vhtJ8fOpMd0FgpjLxUCqIuMAduCB/Rk1tXWTQPtCtV+X/ZXf6uUUc859VfTVt9n3cYdpk7pqbHvQ==</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ4mLNZehf14I2kiFHW9yD9DGAvdhpoOP2E1WVymk9cERKcAIqKGIW5M3N87+XXY9EiWXAlLF6ztqC2DDBCd37x21go/GedNxPcZHRjuo1ZNmHtsPTqeUcv2B7g8CyU8ScAwYxhy+3dUQ+L4A9/XOA+avULKUeHFd5ucW1rD6QZQR</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzv+TuuogZLAorVOh6DPu43kNcFh+7GkgqsTLdT/zyitIOHsID8cssYvnKbJ35W0Ys6FVfEt/bQVKxOnJRrFyKgQPRL9UzbSjZxEaLiCiVbZ5fJ55Ms2T1Clcc71fDfiL5Oikjasaeyz71hnJPMfoaK3LRwOykNQHG41AXjjKWLRRiTbuDddFh0RbbrkvfJ0WDu1m/TE0K3CRhepWL8ZM/lVfGLUCrrwI2WZmvoLMfWoGD4SERJmJ+G5Co1tj0gtjpvYpSANt0TLDWgWiYpz+ocVZmxrDyjmFd6+9B60MLs8NOTyQaWENNZ7fr1pG1C90pWRReci0c6AATkRb8ohhtvAYEck/i1Nq4A3TvBmRL5KTw4FwLBDUBUNlgTHh1kNc0zjZbbP7wTl4s18Lam8nHG5ifw4/Eo0kl8C7+hzLHIfeFFjAW0ejv5yVvNfmnohsmyi/tT72KvtYTnFHWE2vPaCEwmlgO7JrRhZZLAbfC2uSyto4gSDqn/a8SdQxTbMtebJuhZmEeXhoIealcKcmN4n8f0hAHPYaMYHFN+T22S9ZeWqaw9Y0MDRt2oAPVkB5PUUb1wa3bf2jucqXl50Els7EJYIUgC6iN7rtXb4LwpVO+x8ueBanUcr/Cq2Xe6FUdCdCduzcg1eqACpXI8kz3utUaJOlo6nRa6WZurAf5dpBzAmwDdUdn5nWuAnO9v7WPkmfLce9vXuZgQYbME2VvNw2v0LdMXvz66AMATbbUM60Rw0mJKvK4U+Rbjfb0j6EOShnNJzmA+hSi/57TKQIxrCbLEfxJQyQ+/+9gwsS+64jfOrVS9maorZ8ffP5WIeRTQ==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>