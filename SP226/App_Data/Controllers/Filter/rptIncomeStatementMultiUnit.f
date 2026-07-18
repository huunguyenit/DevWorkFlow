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
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
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
      <item value="110001--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHXojy5noBgKx3Sg2+EUbM3n/SN4SW19wrMqzniEJQHDGrUhob/YChh6yH1cpfQVQLDhbgLe8Pd/XKRVriplolqwAR7HgsKy2E3+aBaMdBXUgK0e9AkhbrhDQFWVYyJRmjgPAZBt2wh/s+kxSjMlfQV/J4YmYM4FEXn0BqMQXzkU</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX5k4fakxp2403YCYiA0/kShAE1cFqD2zKzf4zvMC09rYaauiDT9AZEUMc0L9hNm8sIAPlG71ISgfwBH+cURWIEiWWaI7XaISg2EZwUt9NRF+ht92iqucWoju9/Low0HpTu4QsIl3TRzaZd4E5vp9Ojbd5qrdKrKl6wN8sCoLLiJlr+9NNwLgR5l3Vs0j83AzNZF09Z04slTmYqkhAM0MIh0Xk5e3u6mlhD6dQ+e3KAj5JqrjbWZ8y+grGbcxHuha8q44g7LQW79BdRe07QPlorkAewrCuITjagAQbfHEeTZEmEPZqc9zMymcvbmjLbE5gK1stSGyoHYRdPyhsOnNEY7x2VEF7wkK8OWXWOOR6g5c56t3uvnvhU6Rnj3zzstr090sr+XRD3BEphV2i/DgBG4aTnPQJAGuu+GkfEONO6pdnjAadFldidjAkBOwTOJiZF0KSz9ef+utS0OMd9jK2Fhqm5KuG4eAzobGxCbLyXnBWr1jyTKVF1A7+55u77e2Uwxn13sCWEbYOlX57VSm2Ee6ebA5QyHz8nXr/QN1oUA/O2kZhV5Mlrq26uul/qgXktQJDclggjrkbEL40vjOMmt59h6X44rL2wcrLmgnWOUPkMgtBOJ1E7B/H4p0jdvfhdRzKf0cUSQEDJz1p+LtWghWDtBzsQGhr97H7GDZmqeQjC/hIwtmzmnLxslf2stiUolgZiasHPPxP3sA5lSmR1sXQIziBzQ1zgrUtcNsez2tyHrbeQ66P9+u5yYxH0P9Danru2PNr5s1NC9UAB7Yz17+k/b+JTaCRd2+Qual+mIwg==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>