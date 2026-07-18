<?xml version="1.0" encoding="utf-8"?>

<dir table="hrbpks" code="loai, ma_bp" order="ma_bp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khóa số liệu theo bộ phận" e="Department Locking"></title>
  <fields>
    <field name="loai" isPrimaryKey="true" type="Int32" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Công, 2 - Lương" e="1 - Workday, 2 - Salary"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_bp" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ks" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Khóa số liệu đến ngày" e="Locked Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11100: [loai].Label, [loai], [loai].Description"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110: [ngay_ks].Label, [ngay_ks]"/>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIwQBx5CH/ttdc6QCsDIQN2+RexuzPESTSxupxoA42KhCBYcYjUL8uqbgytkZEt3EsIS8s1N2FkUX9vcCInd11GBpgP8vNxPpDlgcXy/MmEw9GRsy68v/cu60YwL8uhYGZ6OKfJSNhakRGy7or66pvTKnoxupLzA5X+LP3I6XNCvs239rElSgkom/9DhTr1cTadYfcHNOhy4b3bx+3kLIdtPncl8VZ0sIbNtv1BshOLYV4p3afGpcc8ebglS5Tm7AHrvPZTHRfy2SgELomI5nl48TSywIWZoO8N/U5apMrgZx0J8tf4vUBSfaMEpsGGw29kW+V3DDIGR/GzFXNV42fysObUp1rfXX1QMkCBqIUiuz/L/TR9jsGUGgD5BZwO6yCkhMGLuqJ+XEs1jt7DkUxcw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7Cc0I+6Pdysz1/gMPnghCP3nXmp6wk8Ilz+Ks8EE9gNmpjyxT5wHPcwOPAH2uC2V6k+dY/PGvgTeYlw/ZhrgRRDnjRbP+CP1cps9i2gyogoiy6/v5gOfD8aMHRAIbziX+SesBC49POaKmyE0PtUZy7LXHIQTaUFYfchqXAuf78Y+KUbJdr0pYYMPmaojK675aT0TvSXBgwLmJ8fH3Mkxvmyw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteTMuVG9w5mqysnjLVvTYMOWt3sEIZ0AOonfjR3THonObs8EwLC9Eehv+7lebCKatbOVzSnMPgqRsqF07GC/eG7WUymtbeYIgv+7VZeNqebWDosRcy0MeCQwCSAYIbBVcxhR0Tgp+SgihxI544a5QKyFEZEfhX/5o98HZx8pO2YSckq5VFhfVxilyR/uQ4Iy0XfeXNWvZ1CIxFYYl9A+ayknXApeFgRwn8gGEiSvZaRHV7jeUJYYD3aj8xNjv0eMyfq6D1vez2dQV3vdr+z3qclw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV61UNKQ1lm9dmaFxZqEobUBQqApIBz5+3b1VknT/T6EnDiIvfbDlo3xSI3OnUEj5tw==</Encrypted>]]>
      </text>
    </command>
  </commands>
</dir>