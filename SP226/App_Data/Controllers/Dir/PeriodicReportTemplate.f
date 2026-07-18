<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmthongbao" code="ma_tb" order="ma_tb" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="mẫu báo cáo" e="Report Template"></title>
  <fields>
    <field name="ma_tb" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã mẫu báo cáo" e="Report Template Code"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="Mask"></items>
    </field>
    <field name="ten_tb" allowNulls="false">
      <header v="Tên mẫu báo cáo" e="Report Template Name"></header>
    </field>
    <field name="ten_tb2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="ma_loai_tb" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="type" clientDefault="0" type="Int32">
      <header v="Loại" e="Type"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="Cố định" e="Fixed"/>
        </item>
        <item value="1">
          <text v="Hàng tuần" e="Every Week"/>
        </item>
        <item value="2">
          <text v="Hàng tháng" e="Every Month"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;<![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NtysGKANauXvU09qoqGeESOQaKUSxeiFVE3tSo7VHNjT+9y73Rcbg/2VChHzUFP2n1r12YgyyyCyaGR1AC0AGU=</Encrypted>]]></clientScript>
    </field>

    <field name="d_tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Từ ngày" e="Date From"></header>
      <footer v="Ngày từ/đến" e="Date From/to"></footer>
    </field>
    <field name="d_den_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Đến ngày" e="Date To"></header>
    </field>

    <field name="c_tu_ngay_w" clientDefault="1" type="Int32">
      <header v="Theo tuần" e="By week"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="Thứ hai" e="Monday"/>
        </item>
        <item value="2">
          <text v="Thứ ba" e="Tuesday"/>
        </item>
        <item value="3">
          <text v="Thứ tư" e="Wednesday"/>
        </item>
        <item value="4">
          <text v="Thứ năm" e="Thursday"/>
        </item>
        <item value="5">
          <text v="Thứ sáu" e="Friday"/>
        </item>
        <item value="6">
          <text v="Thứ bảy" e="Saturday"/>
        </item>
        <item value="7">
          <text v="Chủ nhật" e="Sunday"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="c_den_ngay_w" clientDefault="1" type="Int32">
      <header v="" e=""></header>
      <items style="DropDownList">
        <item value="1">
          <text v="Thứ hai" e="Monday"/>
        </item>
        <item value="2">
          <text v="Thứ ba" e="Tuesday"/>
        </item>
        <item value="3">
          <text v="Thứ tư" e="Wednesday"/>
        </item>
        <item value="4">
          <text v="Thứ năm" e="Thursday"/>
        </item>
        <item value="5">
          <text v="Thứ sáu" e="Friday"/>
        </item>
        <item value="6">
          <text v="Thứ bảy" e="Saturday"/>
        </item>
        <item value="7">
          <text v="Chủ nhật" e="Sunday"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="c_tu_ngay" type="Decimal" dataFormatString="#0">
      <header v="Ngày trong tháng từ" e="Day of month from"></header>
      <footer v="Ngày trong tháng" e="Day of month"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="ngay_cuoi_thang_tu" type="Boolean" defaultValue="cast(0 as bit)">
      <header v="Ngày cuối tháng" e="End of Month"></header>
      <clientScript>&OnSelectionOutline;<![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJdE+AiksoqBbQ7fRsDmjKPSz1pQhw7kBwo9TpErt84VEJRSM04pcDoOTLWcU9pZH3pHq5MWwvPHvKyjWLRnnsxY=</Encrypted>]]></clientScript>
    </field>
    <field name="c_den_ngay" type="Decimal" dataFormatString="#0">
      <header v="Ngày trong tháng đến" e="Day of month to"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ngay_cuoi_thang_den" type="Boolean" defaultValue="cast(0 as bit)">
      <header v="Ngày cuối tháng" e="End of Month"></header>
      <clientScript>&OnSelectionOutline;<![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJdE+AiksoqBbQ7fRsDmjKPSz1pQhw7kBwo9TpErt84VEJRSM04pcDoOTLWcU9pZH3pHq5MWwvPHvKyjWLRnnsxY=</Encrypted>]]></clientScript>
    </field>

    <field name="d_ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày báo cáo" e="Date"></header>
    </field>

    <field name="c_ngay_bc_w" clientDefault="1" type="Int32">
      <header v="Theo tuần" e="By week"></header>
      <items style="DropDownList">
        <item value="1">
          <text v="Thứ hai" e="Monday"/>
        </item>
        <item value="2">
          <text v="Thứ ba" e="Tuesday"/>
        </item>
        <item value="3">
          <text v="Thứ tư" e="Wednesday"/>
        </item>
        <item value="4">
          <text v="Thứ năm" e="Thursday"/>
        </item>
        <item value="5">
          <text v="Thứ sáu" e="Friday"/>
        </item>
        <item value="6">
          <text v="Thứ bảy" e="Saturday"/>
        </item>
        <item value="7">
          <text v="Chủ nhật" e="Sunday"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="c_ngay_bc" type="Decimal" dataFormatString="#0">
      <header v="Ngày trong tháng" e="Day of month"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ngay_cuoi_thang_bc" type="Boolean" defaultValue="cast(0 as bit)">
      <header v="Ngày cuối tháng" e="End of Month"></header>
      <clientScript>&OnSelectionOutline;<![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJdE+AiksoqBbQ7fRsDmjKPSz1pQhw7kBwo9TpErt84VEJRSM04pcDoOTLWcU9pZH3pHq5MWwvPHvKyjWLRnnsxY=</Encrypted>]]></clientScript>
    </field>

    <field name="tk" dataFormatString="@upperCaseFormat">
      <header v="Tài khoản" e="Account"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_kh" dataFormatString="@upperCaseFormat">
      <header v="Mã khách" e="Customer"></header>
      <items style="Mask"></items>
    </field>

    <field name="so_ngay" type="Decimal" dataFormatString="###0" clientDefault="3">
      <header v="Số ngày cảnh báo" e="Days of Warning"></header>
      <items style="Numeric"></items>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="132">
      <item value="120, 30, 20, 50, 100, 100, 130, 0, 0"/>
      <item value="1100: [ma_tb].Label, [ma_tb]"/>
      <item value="110000001: [ten_tb].Label, [ten_tb], [ma_loai_tb]"/>
      <item value="11000000: [ten_tb2].Label, [ten_tb2]"/>

      <item value="1000000: [ma_tb].Description"/>
      <item value="11000: [type].Label, [type]"/>

      <item value="11001---: [d_tu_ngay].Description, [d_tu_ngay], [d_den_ngay]"/>
      <item value="11001---: [c_tu_ngay_w].Label, [c_tu_ngay_w], [c_den_ngay_w]"/>
      <item value="11110000: [c_tu_ngay].Label, [c_tu_ngay], [ngay_cuoi_thang_tu], [ngay_cuoi_thang_tu].Label"/>
      <item value="11110000: [c_den_ngay].Label, [c_den_ngay], [ngay_cuoi_thang_den], [ngay_cuoi_thang_den].Label"/>

      <item value="1100----: [d_ngay_bc].Label, [d_ngay_bc]"/>
      <item value="1100----: [c_ngay_bc_w].Label, [c_ngay_bc_w]"/>
      <item value="11110000: [c_ngay_bc].Label, [c_ngay_bc], [ngay_cuoi_thang_bc], [ngay_cuoi_thang_bc].Label"/>

      <item value="1100: [tk].Label, [tk]"/>
      <item value="1100: [ma_kh].Label, [ma_kh]"/>
      <item value="1100: [so_ngay].Label, [so_ngay]"/>
      <item value="11100000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/2h+KfD/Nizbir0i2bQDeqdcxGU25aK0Q7K2L2Sb6/0euEY2QM/q7k2YliCeNouzjYzzUePdIMPJINdNCoz4tnEQvzUXbcQrKfsuy062ZHZNXoAiguL5FX3HXB+bTetmiYxDTkaXQfZmLtNpXcf7+rEATPt6KwbGMI4yUrMpLF5+Pi7NXDCbrsFa83BGxjZaftdGewyE0mm3Qi+a39ZYbTGD55WFvqK/CzC3j5pPPpSAf/lnTZiy4QD0lIo0wiRqhg60t2Ed5D2Jx/Kj744H5w=</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL756h46nj7u0PvCjTj3wYNMDcRI6Zk28r1qq0r/nmIT9rmMD8Ud5ovjIvAA1qayvfEF8W2BodWnOy9P5yqzy4IfFs=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75wwMe8oJzhp64QbtbghEZ6a6WXRBKGFi1GsJOUceUEnkJFKgrgeW12rb5vJGmLQ0fiwhn6+gOL6ONB/ZIScE77o=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHmttEt3N+Un1w4Vt8hY+oQjXOdjbNeBnW/Mecdz4pHbZU0AkRu6TWGX2JM1WVvkZmCPge0eWiyc8pCvy7ekGGk=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIkHibOl3ERiVHBlw5eAxDeKZyQJHRr/+gq/RT31OTYGpqmT7IIQK4Nkfk0Z4lQ/ZqyPKghPGC4ams2OpEt7o3010KhVSKeE5tdgcpkmKlGoreLGvimXHUTqtgNTbqq36hVA2yQE8MIaFU/Uqt4ldQTwHm95iqTM2asRORjh3PXWz7DrPvJEG81ebIKudkaizw2QY7SDnvolCf60D2uM+eFcWty98/8SexH2K2nA3XaasATUCiuVH8KhJnj84A9YklXPoLC/F/XtKSUHOtmpptHT6kmwp+keyluwTdVY5uRLfnZwtQdqlsddFCCPyb/tQI9ir6RQ+yHI+82g3jRW0u9M/cfvv1q1o5EB8ac+Q3Qw3Qfhxg0kORpqVhveklF4Xy</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CDAOzQyavO6FcRq6ComhBXCEThMAX1ZcGG7FKszMNZH3cvVSYfbUvHNn4cW0Mmn2pO/OA/EwA25843gmZTLEz4xi3sWYlE7VPXwD8MWWS4Rh9Rv1TjqJoTsKAhhGnx9/sp6XKjaL5QjFV7kOM7mykpG9GFC0ZjFhwp1p2mmD1MiU=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzte9/sQLljjS9k95Zsgu+jM+wud2WAac8ogG9QN/AKKbrWNxtgUUbRn37Yh+47TNrFqyj4mhHszb0sd0cs3EBUW0bh4GszKEfr5z++ZTRkdCv1Oy1aFXklaM8BWI0Mn6hWybZ/AP1K3n2WlgUgCU32tDfZQVnjm5Y3C9lMCndFUkqJnjDpcKips0JmktMLOOk6X</Encrypted>]]>
      </text>
    </command>
    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XVz7IEC7BPTOx5ppW30T3mXicJzIfXuYxIxCtP9yp7JHU</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EQyXfTrtb9mrZM+hcRUZ5fZLcwVLadmiB/QhGZLQdZ5YpE809xp33wgDm9q3LdL6GF6iYLhY+IwiepC9gPUJYTauFnNOKwoCEoxUpv1R4ORGvMXGWYsOXdZvmhSWA2wPhQuIPSsTUNWoLxaoPz9oHMMHd/jdU+jrzW1UxLECWhjgWNBvBevAjlwboFc197OK5+ZalixSIGbPyA1e9Wl3HCg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&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</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzxgX4jLMXCAe9HW37raDZDq4CjBlYaRNRjZ7LuRuXFun8ELi2+Kh4l/pRgPM82JY1azoW1pKV55w2zdcHqKrROAESkGFRC1PdIl4enZMDHvoofF5H2qbhKJabyW2ooRIoNlNQpCIgq1Lgh3vQ0FPBbLuBfu0+K2wvtvNvbozFrI85nWD4g4H3lR2hFlLcxl9NbP2XxdRfOMV9yieOTHihxIw6T6ZxPSQKokvOQwd6sFbfLhBgdo8+BKzwva6gMVIQ==</Encrypted>]]>
    </text>
  </css>
</dir>