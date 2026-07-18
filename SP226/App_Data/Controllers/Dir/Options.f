<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir table="options" code="name" order="name" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tham số" e="Parameter"></title>
  <fields>
    <field name="name" isPrimaryKey="true" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="ma_phan_he" dataFormatString="@upperCaseFormat" inactivate="true" disabled="true">
      <header v="Mã phân hệ" e="Module"></header>
      <items style="AutoComplete" controller="Module" reference="ten_phan_he%l" information="ma_phan_he$dmphanhe.ten_phan_he%l"/>
    </field>
    <field name="ten_phan_he%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="type" external="true" defaultValue="''" disabled="true" hidden="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="descript%l" inactivate="true" disabled="true">
      <header v="Tên tham số hệ thống" e="Description"></header>
    </field>

    <field name="nor_val" external="true" defaultValue="''" allowContain="true">
      <header v="Giá trị" e="Value"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="num_val" external="true" type="Decimal" defaultValue="0" allowContain="true">
      <header v="Giá trị" e="Value"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>
    <field name="cmb_val" external="true" defaultValue="''" allowContain="true">
      <header v="Giá trị" e="Value"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;<![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZY0FU0cWM+2X04G66ekfAz5OGiptPKg7Iai5V07bddjw</encrypted>]]></clientScript>
    </field>

    <field name="stt" external="true" defaultValue="''" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="val" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="val_view%l" external="true" hidden="true" readOnly="true" defaultValue="char(255)">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="160">
      <item value="120, 100, 100, 100, 130"/>
      <item value="11100: [ma_phan_he].Label, [ma_phan_he], [ten_phan_he%l]"/>
      <item value="11000: [descript%l].Label, [descript%l]"/>
      <item value="11000: [nor_val].Label, [nor_val]"/>
      <item value="11111: [num_val].Label, [num_val], [val], [name], [type]"/>
      <item value="1101-: [cmb_val].Label, [cmb_val], [val_view%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/OA6bSpzkI+KCd7AgnVJJmyV/xsYS6u8TNQubWMj/OCePtXJgXDC5+fKmcCh3o/3MaBOraO3jcmGfZAm97ciJs=</encrypted>]]>
      </text>
    </command>

    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6QREgDLQykMyuK9U1dNs4qUxdKWVESZ4k2BhxkGXwTnR4M5SF2HlSMx9amtp3sdTwchf/6CxxSGzYH6xlTDva69b5dl3WHHiaqDDm4yL4AR2TwUY/RGKXahr8OkN7h2lfp5KKyXzVPtvHLsVtAGQYpgDC+wqF2YI4iKPVlDn2891Jdl9Wku2JJ2g6hyDyba+GdiBfj5VsSdsAwVL7sJN/tqxuq7XCuSZeSsjMfQ7f0/7kvwq8PvrSWY6uOx4CqNXx6u9n9raAcmSEVBdBleyb4poGxJqz1PSW0sNwWLRJQmskqpRBO+RjzU5p5ArRxUq8Vft66tDnKz7N93KMoVIa75ep/cwbAvgFNBCblZtSCoZ95Otl+x8wnwd8X5Cauo1lKCKW2b4bOE4bX1vKhe/bP/Ead6xZEwrA4BIWcqUcGrrsM79kf438aeTwGRN7rsRAQ==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bFOe/UoVmOC7ZbO0Yjettlhz2D0gvmebxZj43sOvuc9wuCXOCew4Xrpw6xkOzugOO64oxeifL6XdxQRL+4fLaAu0davBcpwZP9lda9PplLsTEgPSlqml8Sld/Gb/GWlnhVY76P4Js/h/cwFBGrLzkb76M17lPxpQHl3gHGKg8DkuMXeqLbxOgUxwLzjvVt/Qc9MZzPVkutSFfQnBlV7bgw=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6eNLv2G4XLyMrN76J5BGTteFUFx5QsJY1ZrjqqdQNpLGJcGM9zSja9isw4AvFZ2QLl1FueZPFgEFA44CYRD8167p1zIzQjUbPKQXf9wEND1SfjxqVvoVeUTwgQKoqu4nBlq9GG/c3GzLNICkvtEjc2c2zhNaSotINNTZGLmZudjUPX5mgKOtS1VNDtzCYRmhsfef19FNlwDe2ZfUn+/g9NDGyGRD3OcFeG5TVmSDNaK9lqTT6NoDaziBShtG2PBEtkY9EIzTvpf5ZDT+j9WOdiHCAiVaVEJTaIHFpEVDSc+H9QNBQ/zqC/igKcQNASd5quRESNWZFcsJDu42ShJXpTsPNRjWVu1zqCB05SypniwD6+qqSXILhTW2M68IH9L/22MEBnBwmVR12xaKA3mxZhEFS7+prnlWc8b1Qv5WSIf41yJTldGbE329ZSWXgJBR0iq3E04TmvgQZVop+5R88T+4Lhe4F/ThPydmPvUK+0sDqsgYPqfeGPFoo5SH2kSTDL6S7tj+tWIWqVntUakQgKnFTRiNj9SUHFRJ7qWN1oYv8W0MvcyyOJranrFt1SK/+OQpftQx+77Z7IfajEyH9nFmAfSzaDR06fiY/ryFTzyKatp8pipJLDY4wLNp8VBh48WSk7rYCrjZfdRFOk7soBSBAGPA/hAFKhbdhBU6SavqEsdO6CvWDVdCI2GiPLekKlGATYrNeOPYHyjb4Iml97brnPo8ajv4JMdiOylaKclGGlXCqnyRUX4UfVR+NeHo3rVfyUKbEMCXKw6i3/vnw/faudeFqtj/TPYPjznDpXaqwpYMCGSJO5Xp4WODbccnhiBlmjUlBfKUye2Riph5ReJu6suo/W7cAHkmgV/u2KAFqr1jYt1V9eqPbLPwACDt0V8ynCXq7JY83jUzq/4wIvsuVB7GTwY7MYszcQRLwfL5l7jhX9R0BP4HepvoAJgrAFv/YkMTtBbp6ijt32aDrUXVu4n0+vEjBKKY/42LnN2q5nVWGOdVs3JWaDvbxfYjd+TExtGMDnOTfvcRI+tAajYSH6hm8PCAjbGBEuzXaO8b2jeCZ+1a8jtCHefC2zANZGMs0vO+zNmO+YWX0oy1rktjMq/roLc02uuv5IY58eo4rGIxiu+4KJbf0oW16krvf34nre1YAxHXweF7qJNI1D9fxY/OGPdeIUT0RRd3hYeF</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%dUxtAbG76hDnHEpXdcWHx5gTebHugLiCl7TyyD7PCttqUWFelNKqRz07g35MsItXUtijw4a1PC9M28SJ75l9nMyL1I8z4l78jtyK/WxNQEzCa6UpJFixtbC/Xh8FtLPTYCntNjqOUE3klGu/weDGSK2orwdGGFwD737k/rs4tp/aCxBkYgjKi6DWf5XihKuqtoKqarNvrkMIuooRGLYMB/tYdWqFox+0yWq6Pm61OpJ5wjgOeYrIlImw2wDUuT+K4hQNdbGNgKTyx6Pou/dL+A==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70CuNab7kQMmL4bzdvQMblI688oIwdtY+/MLlGvsD5d2MLo92AQTS8dQus+rRVlgx4lmQ1b1GF/wvBRoYPjWudVq3CsW3d5+Ne0oOIMvMTu3coHHSyrqqqz/RVZm8+wYcbA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Np0sFOmsenpE70+PvVmSSp4l0i4pqtGNRYn/GqwhGQYp8Exjc7srcxakpLGIdiP2zkg3YhFGYoKyagDLDKvpNuOiKgUK9hG1PgjcClUke6qMD3kk9FXi5z/KzJNfV3WFnNixtTRAZ5Z3FfSAqAj5YVsVKqoSstrna9xqGWDuNnyvbDYmXVJHeaew0hlMjgTSH53FiQJXGCRx4noqe8ApMsmr9lu/U0d1vjDg/1DqLCfwNVTvKKKxxlB7Xt6o+Obq0Qvk67DTNZ9BEzITXOeKRlD/VKG5rObLrLOlwq0QKEnPoB8T7zQhRgo1pxgB17VVLya1+pe6F1amo7rRyYVjlH3+vzy/Ioys8ySzff8lS1nO1SoDtRQrP8G9DqBSavD8BPf+40kLKW/ciol9ykpi+akAoIw4PKLNUMVGugjOLwDldGrSi9Tj7NU5yNLqfrJd8MlIf1xp9UGZaarNr8yFGdD7s1UN4KPQfvv1Z54gRP9Dm51Uwu6pjJ8o6jAg+PoH5Q7uqVxET+J47L1AUpadG6UYy/f4QrSP9mWpn29Aq7A/liQtpz2vcXNgDv9GA1x2qcgcKtYxf6B9vZaZ8Srk162suAo0T7+G5Nh3TDwhpZCZFVDevKFczhOMmCLQ+7W8+ibTI2P8uHLdb58nCXpzVy14WTQxlZTOgQWfBlwwQzpkq57WONxYQUDUhqtJsydsmOnN0d1jBYthO/gCNaWunHQtCziWCfq2Rb9OMZKxskQ/xgit5T5CwaUzdGED9HZWw+qHkU9+qATrsuausm7xJKr45WhwaMZj/WcGhHQ+6UFrBjBl4LvS//oRb5uvmL3C+MS+Umw28wz9VEYV01hJW+rvz7w4GVx1RDDlU1HgOIMDDdiOOroj3XaDxLT1exxM9zofxS2PwqbyMfgK680tuD8ZJfIB5GTxM9aAzcejdR7dHdhlD18R2OM3PEBBLYklvR4qL40CqvpCyrGXgq5YHVccGgY8jPe7jeh1T43VxRYYBJMV2qF0F98SYqAFxaKj5aGi5+PsOeHp9f8cWO8Fed3ASaUKgHNFeHn08Bp1BqsiR9poGnfAcUtrEh4CnPqc77O46229ytBuu8byRpglvHpPc8XlAXSY23cifQqfiI1DUtbiIcN8Y71q4w7VZAGN9fayMqS6YdeRZ1sWrlfxfcIc9Nf4d3OmlGIDx5OmkeApF5LNiJWq+KHhgoFyTnS1FS9mrva0xbGDeK5c72mN9NbMVP1wzW5jbNszhmAy2XBaJNwjXbLt1sT6KrRpJ6rsAtKDiELztg8tBZPAWcSckV78B+TH4gHsG7sUn4kQkiFNyY+2LHtIOHbg/bGn7q4dw==</encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>