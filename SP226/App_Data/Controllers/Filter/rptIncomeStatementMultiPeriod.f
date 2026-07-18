<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY defaultTable "V20GLTC2">
  <!ENTITY defaultForm "V20GLTC2">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="kieu_bc" dataFormatString="1, 2, 3, 4, 5, 6" clientDefault="2" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Ngày, 2 - Tuần, 3 - Tháng, 4 - Quý, 5 - Nửa năm, 6 - Năm" e="1 - Day, 2 - Week, 3 - Month, 4 - Quarter, 5 - Half a Year, 6 - Year"></footer>
      <items style="Mask"/>
    </field>
    <field name="ky_bc" allowNulls="false" type="Decimal" dataFormatString="##0" clientDefault="4">
      <header v="Số kỳ báo cáo" e="No. of Periods"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày bắt đầu" e="Begin Date"></header>
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
      <items style="DropDownList" >
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
      <item value="120, 30, 20, 20, 30, 100, 100, 130"/>
      <item value="11100000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="11------: [ky_bc].Label, [ky_bc]"/>
      <item value="11000---: [ngay_bd].Label, [ngay_bd]"/>
      <item value="1100000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100000-: [form].Label, [form]"/>
      <item value="1100000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsBldA0/ofLF9/OM+wYQh5cGdegLypqmJGFbjqIbmcX1IYjsgb+Gte8TQj412JLiDGAp0Nb5anBsvUTqgWJD7aS+5ksvyziC325Dwiu+CfHXlwt6rBQjGjyG1Z/RvSUUzLl2kvNMpslLlXddb0Z3Q6CnB5Ue0SspwyO3CnluSme9RJckzOm67CckPhxeX3PBBtPyWSC1TnvfYKwZb8gC2Knt</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8QiKkG49Kx1idfVzVS2VIt+XRt3rOFT9gJtGwI2URgtfg9U6g2K/PF3yhG9IHSa2l4etboxxa1ddF7G7YdhaASYEVUwIOqZ3voBTPYz6lTn5dfS799Vo4gAUvpoR+vNuZGDnSAh0/vQP/8ocw9izjq+m6KPGYmuPic1rq4szaN5sw==</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8SfvNz4tGnj6XFkN4MvchDBtYb2AJBCBWuxiBr/ztuzpiAsPr9gzOg30Khp1hYxyxoQMnIPpZAbfid3qySbDGm+c/kEIQODFODJ1pM+iLoVDLb/+Eg9wnB2opkYZT+gn0ELUbPbXT9iP2gd+LHfjchJptM/oiSJ43t1X7Sz0Z2fTzITSp0K9PKEqahHjmydDWvyHeae1W1foQTXhSqBNUUf</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8SfvNz4tGnj6XFkN4MvchDBlOkkfRjgeyjrf8bceGIXQKjAE2mIkK8qpeJ2qy31ao8wJLLdHcAwLytl5W3RQqc9RAKV3154zHX4+kynwg9C2TBGYLImRy/4aI7q+oe/3jx1hbJVmYdeuQfermnxD4q69wppVDVYZ0Kxa+bb/6dIF33WeUrhktXFGH3hLIjTafu1JBddxRWFxoKAyAgxcsFhkMkOcTm5Nm0BWhBfQCV8JO1uYaBr6Qbwba0bjuySAwllzSpFt1EILyqegOU/3Yvs</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJsWR7RuYUdrFLsltMu8kWhbXZd5uboyd7CwIEmlj7El1tA7aOLDsvnm5YShZ0B3f5mQ7199Rumh2D1YlCmr8+gG4CKlE8/HdizIVZfxmZlquFBtvwAoVMUoLc5vc940iFsrkUZidPss0+heGtbVXoxSNYs4/dY/UyDYhY9Uxov0re3MItWOqimuAePp1odcou5xI/44vb56OynBop5zLZ9iNgEbZkM020Y/7ICaiCd6nRgwOnGMTLwzT5C9AI/6lOAqRUuOc6QZE3WHnBy49vErGsWnDdNZFUt6e55F91+3P/vyPmGxJ6Hb4Gshos8RBafzyFvrTYxk9CE4nRCwR6DNH1hNAsi+A4oL9RfjglVsLQ6mL4pm/FEtF3W3MuUZsqmLb2mxBwsEkXykP38ddM4ochqPu4KOePvSWU/b/aSH</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX602dKeB3eFuuyLjkQ7dO2/3AYINWanYyyin2aYxE5fbpiWstxsDvvGEt63L1Fw83D1J57NqVTqD+1mtUo+ZrjSoTLqoteob/gTPfdn2acCQ4uyz02Jq2eB76Dsawn8UgU40pYEf/f6UOZSMC+nu7u0KA9rMKY++zAH+1hMczdmbqifNe9D3Z26Tj9qoCPOAYE5YvVzE+TalsnGk7FQa6gIwycgnvXDGp12k8bWnSoh8niPxk3YzVeNhkqFHfKmZQlvn5Zr6sOcXTLBDzLXW/621KNS8vXcjA5POo2umesXhrjKyooX/mzGspGGc1mawM9njrd2pGeJrPZv40Cz00yBkgCdS8ZT2/ALWiGVLNl+jmcqj8S+NIn8EBtJ94rnpsixhdZQVW0Gt7DcXWLLU0H9IxYt+i9fvVtsy31E4MpFnq62MTPyp/GEdsA7EShhEVw6hsTHWYvsLQmyoUauvzjyW+qfw7A9NmV8Ydk5nq/MH0S1/N280P5yv30B8uQdMK5reqHOrtfZTd8mEhhuqLeEzca8ggkopTjqpFjqtVzzwJ7ptz5XHgH8LeT93Z2cQymrqEaAphVNHkcU3+hQAQERzNngAgA+WgwbhwxPlTJg6G3aUw4qPk1X62xtJytmSeHSsMfNlMS8NRYEvAMAK4S81RpNjoZeba8pusITdYbBkXeLLiOZ3x0OL9kYEQm1IGqiwblqVh/dFHpLypFMxOw1mxD0LrkXg3c2sEw3+c1LyP8YTMJP93819IEPHS1NfO47ypBVwk1FSXYRPjPh1UuZjFkQs+Hrn41OWCszUAu17DSl5/2fJTWrCRGxilxMMiG18AVmXN9GTaVdP1c0eFAG6I7vcSe2IYYmoypG1tkWI163595opY+kX5OJm4DLTwbe15dWnTTe3vpTvhhR1kHMySqtYTFS1xIaDRay4EuItQNWIRWony60rSeC10MEzxcdrRDycSyJzZhctQyPV+ERhEOl3H4v6gVDDl9IQhkN2Ds/+UKOjNPnRmIkkRg7DMQ=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>