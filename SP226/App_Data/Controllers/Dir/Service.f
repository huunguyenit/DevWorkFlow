<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY k0 "@id = $id.OldValue">
  <!ENTITY k1 "id = @id">
  <!ENTITY k2 "id = $id.OldValue">
]>
<dir table="service" code="id" order="id, type, ngay, ngay_th, gio_th" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo lịch thông báo tự động" e="Notification Schedule"></title>
  <fields>
    <field name="id" isPrimaryKey="true" allowNulls="false">
      <header v="Loại thông báo" e="Notification Type"></header>
      <items style="AutoComplete" controller="NotifyType" reference="ten_id%l" key="status = '1'" check="1=1" information="ma_loai_tb$dmloaitb.ten_loai_tb%l"/>
    </field>
    <field name="ten_id%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="type" clientDefault="0" type="Int32">
      <header v="Lịch" e="Schedule"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="Một lần" e="Once"/>
        </item>
        <item value="1">
          <text v="Hàng ngày" e="Every Day"/>
        </item>
        <item value="2">
          <text v="Hàng tuần" e="Every Week"/>
        </item>
        <item value="3">
          <text v="Hàng tháng" e="Every Month"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;<![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NtysGKANauXvU09qoqGeERJTZga5q00yi9hgqI/7iEgAld4/ee5yFLpelSsz5nOvClAUrPRySIw2A6PIqxtLNM=</Encrypted>]]></clientScript>
    </field>

    <field name="ngay_th" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ngay" type="Decimal" dataFormatString="#0">
      <header v="Ngày trong tháng" e="Day"/>
      <items style="Numeric"></items>
    </field>

    <field name="ngay_cuoi_thang" type="Boolean" defaultValue="cast(0 as bit)">
      <header v="Ngày cuối tháng" e="End of Month"></header>
      <clientScript>&OnSelectionOutline;<![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJdE+AiksoqBbQ7fRsDmjKPTeI2OpLXRiZ+NKF3vGpbl9gYoJv9Xnd71jyAEo9oszHQg1wU+VMi134vFpLy/Q5DA=</Encrypted>]]></clientScript>
    </field>
    <field name="t2" type="Boolean">
      <header v="Thứ 2" e="Monday"></header>
    </field>
    <field name="t3" type="Boolean">
      <header v="Thứ 3" e="Tuesday"></header>
    </field>
    <field name="t4" type="Boolean">
      <header v="Thứ 4" e="Wednesday"></header>
    </field>
    <field name="t5" type="Boolean">
      <header v="Thứ 5" e="Thursday"></header>
    </field>
    <field name="t6" type="Boolean">
      <header v="Thứ 6" e="Friday"></header>
    </field>
    <field name="t7" type="Boolean">
      <header v="Thứ 7" e="Saturday"></header>
    </field>
    <field name="t1" type="Boolean">
      <header v="Chủ nhật" e="Sunday"></header>
    </field>
    <field name="gio_th" type="String" dataFormatString="HH:mm" align="center" clientDefault="22:00" allowNulls="false">
      <header v="Giờ thực hiện" e="Time"></header>
    </field>
    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
    <field name="last_time" type="DateTime" dataFormatString="dd/MM/yyyy" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ntype%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 5, 20, 20, 10, 20, 30, 20, 10, 20, 30, 20, 20, 10, 30, 10, 10, 10, 20, 90, 0"/>
      <item value="1100000100000000000001: [id].Label, [id], [ten_id%l], [ntype%l]"/>
      <item value="11000000000000000----: [type].Label, [type]"/>
      <item value="1100000--------------: [ngay_th].Label, [ngay_th]"/>
      <item value="-1001-101-1001-10001-: [t2].Label, [t2], [t3].Label, [t3], [t4].Label, [t4], [t5].Label, [t5]"/>
      <item value="-1001-101-1001-------: [t6].Label, [t6], [t7].Label, [t7], [t1].Label, [t1]"/>
      <item value="1100-----------------: [gio_th].Label, [gio_th]"/>
      <item value="11--11000000000000000: [ngay].Label, [ngay], [ngay_cuoi_thang], [ngay_cuoi_thang].Label"/>
      <item value="110000000000000000000: [ghi_chu].Label, [ghi_chu]"/>
      <item value="111000000000000000000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCgaJ1aF+8UdVYsCWXjYd+w3EPqGID7FM4l5cFgnI3MG8y6VilzV21/eV8y3kr0nN/t0oZKrKf3CcLmzmsrBXU+cS3A9QXy1jywvE/FN9s0e</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCgaJ1aF+8UdVYsCWXjYd+w3EPqGID7FM4l5cFgnI3MG8y6VilzV21/eV8y3kr0nN/t0oZKrKf3CcLmzmsrBXU+cS3A9QXy1jywvE/FN9s0e</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIutxuyKf+IsGb4De58MLs2k4saKJBK45wmL5bAOKMt0s40Nme75/chVqhTvMAW8mfeOtQC623UGmEdNSNoiZm+AeiKvJ3N9+ptBtyZ1zNqtzChwN2lU10WXNfz3QGrzIZCM6U+jOxn8g91EOtYI/HOx27tfbt0nbFU+G7wtNcz+Uc3URRw8keGN9jnqBTaItbsc565N9vYqQtoeiGgXLq+cTepS/tgcpbYq3G5sruKjP0c4NoKFetXLjc/T4+Z8sXYjCa9eUuyL59aH4NgUw8bvmzF6EEva2/8pBsgl++7Z/ff6Jz2dta3xktm4TJUCOUjD3ihSSPtBVSYSmpdYgqJ7RT4PHKoqGcjO+F+K/40Hyqr1mkba8FD+tm35YFz1xnLhSQVwZH9C4sYdfrxJ+9/A==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dVk3waJzJqFnYvAIGzHRkQyk1Q+kkPJClfAd07rSLxqjtdoPb1hMBKsR98tG+k7kJLnY53f5aK0z3tG4QGJDFHtPu9sUbIh2B0YaFSbYK+OVegYFq8K/XOHFhGRXJ6vS30=</Encrypted>]]>&k1;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLYoG/P/oDL04ZhFMNSc5zyZOgZBxYatAn4K4PPyuIWhViZFOAvp64jxxmlBhxm/LrJn3tYlJhbmPax8R6M/U1IxEKLkU7sL7agcRdIn93OJlY5agSwswnQPlyLjqp1Hux/wGRYmGGvmQ3JuA2kV/lm+VXVc/lNOb/mG6QpbpBuZfQbP2yCLwF6yumY0x/fVDbA==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dVk3waJzJqFnYvAIGzHRkQyk1Q+kkPJClfAd07rSLxqjtdoPb1hMBKsR98tG+k7kJK+ylki8i/cf2j7YP0zbmui9Q1QIri499dMpQ93Dff+V0FZDkgQsoTjUDacrekb4cw=</Encrypted>]]>&k2;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLYoG/P/oDL04ZhFMNSc5zyZOgZBxYatAn4K4PPyuIWhVL/9OFFLKIlWBZCpb04AMSi1PyNse3N5VxLjh9UBuCU6skI8p9IKmMN1yhzrWmDMhgysP3QoR1S7BWeCadNwsGAQAAMY2n3zX7wT+ohRLKMbqSgbh3L+fCytAgy/sUkk7</Encrypted>]]>&k0;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLbWKoL5jETtroDAedIqUQR42mEpHAQGseHKQPt+hO6zMVZCLu0/56nviMMRE2b0t5VXIS9FErUnVAIrYHbfYuSE=</Encrypted>]]>&k2;<![CDATA[<Encrypted>&YARH0qdfPiWP620v9FAeSPICrzWaA8H4buAdoshnAjQ=</Encrypted>]]>&k1;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP6/iWGgqc9McJnQBh0lQR3qLWcAqzzZdSIeNHboefngHfsMziXkkTtOkHaaoQskVGllKmoY0JX5k4+tDQFYdXamR+11DxdzzIPW10SHp2rmXIgQxDX2zidwmzur0+7zr/Kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVzpC4ldabi91hmhUGZD+N3/R6MGUEyne1W1VOoXyz3dk</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EeYT/nb/I+z3WJU/tGX6pDc7gYgFPdHFPV5LNASnAqUhHGTT6aYNvSoOnmkUEPo8l8uitk8e5hVB07DGshoWVKBFJpc1/ZN6qzp068lf/XFemToeD8OWDFNaXQhEibnh5fCTww+yJPno71T9I9k52gM=</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtefveo4P/vzBRhmlgvWXwvoA5Dz2tAihHZlrW198N4JAT0VB24UlveCBR9fx3gDvXVl5BsJg6ypCP0e+GbGm/K72LAyxGUsKw6nHhcf2EtpH+wpRAmPc6PK7UjiIlYjV06ianPm9XAZv05u6yiT83lzjieu9PpcoIA6Qp+utDqPhhtZVhPgx9znjRAnqnkpn922XjdaWa6QeDwnlSNU5m3kUhKtwrub6zg0vLG2rnvg0lfRiI0CHShZc7BOgRw185bDUKlJsksaG3yx+XAI8ba8RId7kus0T2Ihr8NMvxSOkETC1VKUyuDzYCAfTCum5rgOiWa/PmGmKezjcVqSnSVU8m4AKaXO1H0bKnz/P6uEvoB4qvM6I53uhHjokARIBIN/9ux2LQ3Ved0rK3oZAzT1h2JNxu0Lph5WFcZZkL9mh+KmzGdoWfINf4OI4v4Oi3tRxV++Z2xpglebeLLGCbbNSZ7xKbsuk8jnU4bJzcWxpCHy/fBTGvttnmMrOGAVjFxkwJURndbZshvOw3Af+0exQ84eVRHxVEUoKRpeK5LkOxPWWAQ91UZS++eg0V/+EdjH/bbMLTkg6oLSPotcJeHzaJnNuZHfswLUBtc9oenGfr10EKZ1Md3hyUe3v0r5arBsYLe02tIOvg8mgVDt2IAyGVnrBKKC6w+7dobNNcvLx4BlycpZHZ9y9yTtU1gA/L8kuXEJvvVzVrHbyi8Ximi3fPqyAjIcfPFin28oB9szwXP78nVXdzIH6DIk4/fRebXXfRf3uyyqt9q58ilxFtx6IB2vuCpXiLD8x1imCalG1f2IKXw81hW3j5MFb8QzHQvzeBswRJKvWm3DI8+upHdE91etfS61glBfmwqZm3lvVnbBAIo2sU9GCqQJwPqsUXB5vLC88houn6wxxwuwQ5xsE9xPqsqlfObcsvXWmYLxF5gJdIAloRn+Wc9ELZxLt2l+K37UJTDqNkrTQE9WJki9AquNzyu+hs0oQLpy1f18YYL3Coy1pbmlb2nVDIn1n7HYlKTUb1R5c4HkDftG7TaIWIAJVsd0SOiqoc2VLQ1Wx/9wO+dJmebgOfpMEAq9IqrxuRwDTD/QqBkLkBVeRM+lKTal5QrMyFvXfqyBVdWg7ZV8UBHz8jSu6VISbvHfG1jK+V01KibD+RUYzFXdor8Eg+/i0RBPAcidxYZHo27Ly/XaeovMnickDSbDZ/3jEh/j8/AlbLTDjOl5qgylGRMi1BKYZnDYyzhvykrUaCDLhBdzpUaRSvQbCywaNi8sVuyerBqkHpFWvBv7ZhsTzwNXHVTqny05JJHKMqViX2Dn5kwjAIM17Zr7A1jDlApQJlnv0v8NeHiz+eLS8pye9gQU=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;

</dir>