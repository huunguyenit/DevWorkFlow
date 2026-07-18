<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir table="dmkieuduyet" code="ma_kieu, loai_duyet" order="ma_kieu, loai_duyet" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="loai_duyet" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Loại duyệt" e="Type"></header>
      <footer v="1 - Phiếu nhu cầu, 2 - Đơn hàng mua" e="1 - Purchase Requisition, 2 - Purchase Order"></footer>
      <items style="Mask"/>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11100: [loai_duyet].Label, [loai_duyet], [loai_duyet].Description"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPEn+XQKX1xKEWaFujsqsDmwN54YcN8XRqn5hpxfA9w6PYy1dcTYBqinD4SARc4XV9aI4x6kFrEibtzhT6v4fdSCOpGr+7l9ZPYpYfHLyMppLD5FVndyX9Yo1J4k0R7ETiHjVL2/w+XH/9Y105OGhy0Vr2aDFlOtg54tYOtOv6YIy7RQtxkz+YzSgQjN7M6D/9hoAp1GDB182fN8aa6vM0JYz8r/V3Vw1e7RnYT0vYjjJI/2WA8qJ62PyPC2uOdrlyzuSnFfnyAVr1UjCeLMxlPNlMoB6Xi2zEkQKN21GoKJUDboE9xEpfXYJsW78euPH9l/mzj8HtwantCnSzhem7025x+aZ7ToXbSazxQA13nsTTvop+9r7yWTYAtJd3Xw+ahTDFPIONNr3W8wwN4ChUMb3Dj6QTrGmXoKSU7pnxXyHooPkmmF7xwtCTAN8pTQLJ/jQMjvb9CPK3kWCykCN3m52hKd4PvjqdIEAFDBRxVCoDRD0Vt1Lkf3VXXOzYfcjupOuPkl7/n8FVvk6aVFhIVAsos3CyuKBHUmEyyFp5WCwzZ8rGx0hBLgmL7z/TI4pnCZ0dJu2p/d4Jg9G3wUo69A==</Encrypted>]]>
    </text>
  </script>

</dir>