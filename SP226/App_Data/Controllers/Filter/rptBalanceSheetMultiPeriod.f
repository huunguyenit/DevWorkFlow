<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">

  <!ENTITY defaultTable "V20GLTC1">
  <!ENTITY defaultForm "V20GLTC1">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>

    <field name="kieu_bc" dataFormatString="1, 2, 3, 4" clientDefault="Default" defaultValue="1" maxLength="1" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Tháng, 2 - Quý, 3 - Nửa năm, 4 - Năm" e="1 - Month, 2 - Quarter, 3 - Half a year, 4 - Year"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ky" type="Int16" dataFormatString="#0" clientDefault="Default" defaultValue="3" allowNulls="false">
      <header v="Số kỳ báo cáo" e="No. of Periods"></header>
      <items style="Numeric"></items>
    </field>
    <field name="thang" type="Int32" dataFormatString="#0" clientDefault="Default" defaultValue="1" aliasName="Period" allowNulls="false">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>

    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear();">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
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
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="1110000: [kieu_bc].Label, [kieu_bc], [kieu_bc].Description"/>
      <item value="11-----: [so_ky].Label, [so_ky]"/>
      <item value="111----: [thang].Description, [thang], [nam]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4QGz7dL1kAAwh0N69zLjeB385JGGVlBzgBxlZ3SKd/jYFPbsrOOCyCTWgKeJTxDXdq8z+kBd9enJSUcqY0a9I6v3qQ4IImY5/uZlYxTa1+cHrO7SxLvHZSNR8ro2olfFAxUVdp39QUkmKmS5RFrEY2YEStMrx0/ZBFeOGcIWxLpEbGi2JJkb1ZBAggxaE3u7iumhahbShoScKJQ9Psa4cyF++7qCcAn2Gg/P4a6nFN43DHJ37gNJQzGBV/sQ+U9A8azPJb2U9l7NZLaPrbtfmSfZ01dtWjWLvHMIRS8tgOTYpZBrrPPyCN/pZI88OlVd35b1vjKuLh/8B1vmfRua+zrLg038Cq19n3IDJSbnttOs6WFuEUDqQ+OdrQu2GpmwcyKRBj4d/bTtOiMcgC/AdQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX7GkcO9vCgJ8hulEh+QLKcwv8cacUBRvhYRBYcQAOWfmQaSNQ+iinZAMaDnR1UFwRish6KLfFPPYr/Vcy6lvEgmrJ95Uok2H7uf8Gf030/Q6aUC7jT+14EaQN/uWtoeQ2e2IMCMI/l3OWw6TQJ9gyVjMyw/cDJ2aD1hGmnq3qvLEMIVzSDT+9YKRLAj0a4EZ6mFhHGC+j65FwTt36H6FBv/ougBzy4l/NI1Fp2Q3903zL6kC+2Fc3BTQWj1gIbip4gtZgDIO4Vjn5Anaw8HDSUGckKwFc8RCjK6T8yugq4jnKIGxsaYYBv813a/LwljJk+LK0En8f4kTg37EckCkvfJaIEnMGUVYCPIp8Ije5H4FqA1Gd9qw9eb4BHuK1zyG+EW4B8/8vzVmmLUsZtEaSJaN0VWmvK63p35eQrB2xQewoNRSizDwHKAJ/lpG/dTUbPD/xKkneO2Gw21RsQo6n7rSfPiN23aNIz5ZVvMo9kjI84Ml4z2YDVykQ3/wFN69lPgB60PPWxEkrYJx9HPps6eMRnDJm4u8BdoduCfJNFtWIpr0f04SFy8VIYlSVeHUslJ2hfO3N1dCmYXvYog6b0qzJ0dKjrxjhBm1hieNDWBkLFyiRX/5Sdt/ANb4ESmSxqqBkqxTaZD1hyq97M5CbTfAuFxgAP+GLREb25HwXCENjg88NkrTk7J9ozbl24BNpSZr7hdWCME67iVlRvMXrq9XBJzS3jE/X6vtQg+EkslORE2Z14AcfdRmF/Zc2/TitKGs6dX+wS7gJvKsWItkP8yAuhB90TdD1nGUAq5/eLK+1uKUL6mLOYKvKFBOyMPV50lUC0M9N/xNpMYbNQyiIG5</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>