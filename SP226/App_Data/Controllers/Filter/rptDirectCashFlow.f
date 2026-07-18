<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY defaultTable "V20GLTC5">
  <!ENTITY defaultForm "V20GLTC5">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky_nay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Kỳ này từ ngày" e="This Period Date from"></header>
      <footer v="Kỳ này từ/đến ngày" e="This Period from/to"></footer>
    </field>
    <field name="ky_nay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Kỳ này đến ngày" e="This Period Date to"></header>
    </field>

    <field name="ky_truoc_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Kỳ trước từ ngày" e="Prev. Period Date from"></header>
      <footer v="Kỳ trước từ/đến ngày" e="Prev. Period from/to"></footer>
    </field>
    <field name="ky_truoc_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Kỳ trước đến ngày" e="Prev. Period Date to"></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn - năm" e="Standard Form - Year"/>
        </item>
        <item value="20">
          <text v="Mẫu chuẩn - giữa niên độ" e="Standard Form - Mid-Year"/>
        </item>
        <item value="30">
          <text v="Mẫu chuẩn - giữa niên độ - tóm lược" e="Standard Form - Mid-Year - Summary"/>
        </item>
        <item value="40">
          <text v="Mẫu chuẩn - bán niên" e="Standard Form - Half-Year"/>
        </item>

        <item value="50">
          <text v="Mẫu ngoại tệ - năm" e="FC Form - Year"/>
        </item>
        <item value="60">
          <text v="Mẫu ngoại tệ - giữa niên độ" e="FC Form - Mid-Year"/>
        </item>
        <item value="70">
          <text v="Mẫu ngoại tệ - giữa niên độ - tóm lược" e="FC Form - Mid-Year - Summary"/>
        </item>
        <item value="80">
          <text v="Mẫu ngoại tệ - bán niên" e="FC Form - Half-Year"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="11001--: [ky_nay_tu].Description, [ky_nay_tu], [ky_nay_den]"/>
      <item value="11001--: [ky_truoc_tu].Description, [ky_truoc_tu], [ky_truoc_den]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsBldA0/ofLF9/OM+wYQh5cGdegLypqmJGFbjqIbmcX1IYjsgb+Gte8TQj412JLiDGAp0Nb5anBsvUTqgWJD7aS+5ksvyziC325Dwiu+CfHXlwt6rBQjGjyG1Z/RvSUUzLl2kvNMpslLlXddb0Z3Q6CnB5Ue0SspwyO3CnluSme9RJckzOm67CckPhxeX3PBBtPyWSC1TnvfYKwZb8gC2Knt</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8QiKkG49Kx1idfVzVS2VIt+XRt3rOFT9gJtGwI2URgtfg9U6g2K/PF3yhG9IHSa2l4etboxxa1ddF7G7YdhaASYEVUwIOqZ3voBTPYz6lTn5dfS799Vo4gAUvpoR+vNuZGDnSAh0/vQP/8ocw9izjq+m6KPGYmuPic1rq4szaN5sw==</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8SfvNz4tGnj6XFkN4MvchDBtYb2AJBCBWuxiBr/ztuzptg3ysyH29AFd0gGER19UPcM2VV0YFkJQZUeaYQ+lT2SHZ2BIwYtmMpP0xLuvlyLKx06QTaKEXpPuAcjW5JwSVt2Eqhme4az/qKQSRKtSp5eNMzrMTsG1Gbx6cfyA1Lj087yKurTo5T08Vagnvhm+sJfIvu9cE5/NxBfACj9p6Ln</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&KgiT2k4AdcxFxW1gK2q66hY2Q8s18wMZY/spWLapXuNMp84vLgEey6QGSEB+UzDHo+Kgc2UJrqDWMGkf4DPTKQQ1hpImQmxbUDCW1abYndQ4mQ+RASDIwY4lZRJ27t6E/PxQ76AWsaR8jDc1X8pKym2Y+8WO3/wYMhTmkBZxI+kVmwr4T0cl7bB/2zWvx8x+aA49L995RzG3bY0nNy5208R18HjvZ/OGLT8ektOuXvzcnTKfCITfPPxefu8TOcNjEYuNEfDPpIrKce2n8pdYA0vR7IDNdj17/NQ7r9xX1qNuiHd1Wrd0sDZKx+tZVr/Q</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/6ws0KaX+XvyBziK9G8DscEmJeGYwTQ1DqrSTk1onnqZ23Irf1qgAQfxnHyPZQcd1SwefJOuxJ1I9xuxBR/sAbpHCDVZu2c3neBYTc4/65SACvYHyc5kjF9DBksA/vtu0Pg1YZI4N9MJhhA3FLKuPUZTwYtQ4Mb44zIpkBCpJ/yB699NkoWgAuSmKONjcKMT735nc+s/tTe1Y676CgCh/cupoScDn6AUbakFbokvjWHn3K4juhyVf0849v69Blj1zDeL83p54FUyC/Ds1FToCONRtZqOuF+5SlOwkEkxrgRy1ItmsCH1GPrrQQ26bRr6Th74hCOFqlb3PCHd9eug2FvGMeeX2dQWbv4XUPComw36MiqlP1CS9rHNFNEpNg925+Ae/afyR/m+lr/NBqjLwu/w93H49xW23n8h0exVCkaroZIjTq/IXf+kLS6HgMMW3uGaLXdm9EYokwX9BjR5sQpJiRfq70Bc31vD0W3oq12oZAxCQ78JKScmTgsEL35TE/5LsbLL3GKG+GE5E/wY0mMHnys6BKiwKMuClVwXXWZdwh7+2Vl/zt/BhzIH4qoyEbitQLta+4UKUcifM1zApMxrNYVuPP4rivOwkV1S08gWZogJFbZdExFPbXQ3Fshhrh1XkaPIN1N0tokZmpkCAM2Nf0MxjETTluqgjOU4Pw5jhuy8MwVM0A8h5/wImcuzo3iXewPEmU11iSD/1oeMByc1zpuuuOGDXcPU4MaytJzKz6TFtre+KonpcmK3uNOnOb5C9xxhu86Tho0Tbtl6eUF6iwrLNXIv+niK4UOJHl3zaHNYh9jXHjh0yhP0Vgzo4t+JVR/b1mDBv0vkLLmRKl8AgzSKnqGYNbhlFzCPR2ahlADg9kFVU66dTExDsOkayWpCYPDeuHjBKfRrkN7YcAgdmZf12BMpFTNnYDsAgn/p9BKZ9/YzcB/0LxdZBrzIhnKPRo+vYw0KEeh30U39XeWJCY0GVzr3EqeKkhFvw+UuzvXNBzpSr9/kZ5GykYQlHQomnxs9BLQs3BrYKs0ZLOkeYFss0lelDhVTfQ0M4SsW2jxP0gVxRbe1tZXHpYHWa2Hr/cO9saG9knCfTZZQBij6/6neDGF1EfHjXt8Vd3Jb/15kZCV9qEgCU9xTV5oUwpN1oPtOo7myuTMaArJ8FiFD7cY+sPFxkDwWJUZXVEDvsP0o/yc4fuxle6p29p1NAvSX3NB+QE4BdUqZuPHG9a+GP8nECbBXeOF2cPLE/zoFSGA/y537cCNx1tS4oSroGMxIQ9eQ+2hmtrr9wKqZClZVctrbYjjDsCBWFmL3CCaCMJ15TJAwPEXisyOpXeyCGsuVjg7x6Mxmy4nFSi7Z23enDlPaxgsglTfwTKl89wCsh6ytfaib7vGJ31kTqBJ4jo8ZprKkqiwefh1um+7kh2x6DKU+3pbEjEMsCy1JKIkirhDuepnXGqWoVCumgHlxbWD1Hg3pU9VU5MXQGPOIXPu6GLZGg7IxRF+IjGIKIw4pmJnj6Z2+XNfweg3RVGlxifQiXoYx9lDEX8d4vE6hqzk2uiw9ytf2bPU/2tXNkTbLChUIEDMCqOZu0MFv+fvhPvO6mggk0BndvEF/dS9lAPaAV1HnC/N7qmlcuGtvAOoudZuQZoxh/ipXTKeDqK64VNfuYDzexwc5NOMUwFCqgKfn1nMeQdbwxCZgbReo3GggZCNIIUXivqjxsPSijBwfXteQD48CkvtH00TzY1rgPZF4yBq0nBMYSk80RcTrZevyKt8hdi9etTDMiWUx3diEUFBAHqqvi4MJ2tTH5MbnsDaoQRfQFHiwfyk+WiPpiUmyGT8B/gCRPMK0aT0ycfGvHqJK9jWiR8vqB33eZlrXv/j8pQ1kWo5AzhbnW8yocs3Hgf4RVdB2V5cLq0T+eUugxnhip2LUnkjpVX0L+VtDeezTt0eGqIzBMC8Lp/9Rq+Dh77D2aVf5ag2dyzb5NnMabAb8eJWQ9+1AqSjIZrt5QYQMEBLYBHZ07m6zYBS0m2MhCW0GorZjhRRU0Dh04D60lAfERKDsYr86SFINEfgrmMeWh9DegcnBMiwALgQufum0XStJef/OE20o2S4DvbNek/bPSp5qCOJUj2h1lTRh93KpWbxgA6AmdBlm1mUbr1JhfvB632Xs/nQtCUlBjl/rrMU6Vp7GZVQIceE+RcaEh2yUkrWb3rSvh3jn05T/M4lJU9QWNvpWX8xBX5LeOzv86uXIGyOOsqI8ulviG94PTj4pDhvc4MG9ih29vtqbG0/IzssW4yDrqqnPwObGDFGk9TS7a7r5NAVyPKbLLYsrziulhVceAqPdVlqd9+5z0uvYtBGHG0KapyHqj9LYGVupPved4OekmVPjP3X04fHLnslDtp35HebJQsm1eIomaM+c+XTkxdlTTLQftVE6kogeLJucF3mKvuYvXed/lxJdAssOmZyQ64WT8kUFDFWh3v7929wh5Cuh7EeEw9o9boZH/ixH7SpPik/g3bubLeLzUT/H9MQAckBTFSfiL+/uneXgLeghPDG7qmAhVUSxW6h4N595kNjuLx9Jr1CnxN/fQNP1gc01H47vaW/ohKTnoWh</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ4mLNZehf14I2kiFHW9yD9Cg3CFoFNXMx8Cm3rF8wKtYA6j7H9pl6qgtkwZVLikLUCVBoocor2TfqTahTlhk06Ik38JL5EsGLDF+urtvAKeuDwr+peHd6is9CR/zfA4YMj/59R4xu4FIujuc33bKpRKvW/c8Vu02ziiRON1CNgRU</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAges8o4N03bR8+GwFVqH1UsAwiD34gICpz4d6Ep8ZVeQkvAJourPowmjoEkm36tnkIoMsnirAOf0Xc+0FD9gr5Gq38jkCMqPq+HqVwEl6jRdR0hR9zWSJ5Ljj+syCqxe2kRSeXaR3mxF+RhrIOlSGcUSk6/DF2ifFIe4gJsy9Ltpqmf6fdUd/omOQW/piP2ck4x24xbsM1UblscQKQdqxyJyZ7WQOkdRzucrnjo9BvhbYnggiWRmsIjdWq2lnDIqIdqgYjP1f7zhAmJ6irP5zd2ZHe4i5b0unglasTNDvOsKhqNYG/NOyCXZD4R1XUitraB/rgx6iF6rHrfnKrVndNNHchOvZhFQbcjT7P7x3Q2pqDSWGQ0uFTGgj2Q4L7BCeDV7RtcdR4fnRlHnVoXf5NEy6mmc7ES6U6M9zvEKEBoQeXhvbxPAqASmssBCl67iyy6aYeP5miYTVSoy8TOMMyIPKvhQvQItse1ikMANE2dZzy2pgcyqLEI4g03AGfXb/GlCzV0qAfPwGFH4NpTPrADCPf98IDCL6htK5NfEKTSyt8m2rY9n9LFhjQQaOeyt9rcNY8A/b5vOpVCUOWd6wQF2CbgyeVMp9IMdmo7LoQQtfwOgYhXK7Sgz0Ey7xsCe3JTxfQ0RNiig7brpUSLocYmG2jOl4rJYrdcL82uhKc4umoW6DHdTHo2oY6HEFC3wv0ZuuEAByySDKM/CqGp2ZscGX7XmwGUqEQJV+A8bXMR55H/YCSEOh1738d/INTShC8sazeIOfe6XE0mNrLmJNAC9Ae152r2gZzYYo52sQf3oZSK8miX2KlaevBwIy79cU5HOLznfRZrjX0YCJbSgtOFzleOTFmn+I3GmVV1bMpWQAo+3XA9DwbEciocWPMKixjF6Jlis1k+t0wqr9AGY9RYDCccXb8k6QDfCMPeKKDHPcgePcXH8P/HCb4VWq2Ho5dO7rlkhgRGA/O/4imrg2OfM50dCbrKHl9TUmdAQQY5+AaxBI4SkzqtsNgM1h8nDL78dBKAHdAc2Alip7C54vxfnE62rrnQrzAq00kRSXQDWVRpUK53GMd2teRFAU29ZvKeMNV/+bFNIG+sftXnfCfs=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>