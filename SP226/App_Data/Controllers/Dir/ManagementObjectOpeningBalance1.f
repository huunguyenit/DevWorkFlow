<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">

  <!ENTITY % ManagementObjectName SYSTEM "..\Include\ManagementObjectName.ent">
  %ManagementObjectName;
]>

<dir table="cddtqt1" code="nam, ma_dvcs, tk, ma_dtqt" order="nam, ma_dvcs, tk, ma_dtqt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số dư đầu kỳ &Name.Title1.v;" e="&Name.Title1.e; Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" readOnly="true" hidden="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="Default" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and loai_tk = 1" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l"  readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dtqt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã đối tượng" e="Object Code"></header>
      <items style="AutoComplete" controller="ManagementObject1" reference="ten_dtqt%l" key="status = '1' and dtqt_sd_pslk = 1" check="dtqt_sd_pslk = 1" information="ma_dtqt$dmdtqt1.ten_dtqt%l"/>
    </field>
    <field name="ten_dtqt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="du_no00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Dư nợ" e="Debit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99D5JksYEPBHk7jjBP3nNgPjHohu0LllL5AjGif18foZFzhVuFEvRHykz4/nzhcvo/0zLsaUTyca4YmCFKC1elmI=</Encrypted>]]></clientScript>
    </field>
    <field name="du_co00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Dư có" e="Credit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99D5JksYEPBHk7jjBP3nNgPjHohu0LllL5AjGif18foZFYNXdZ1Ci7tv6iBPmLlJusDI1+OHJruy2mmlpZFAOqQc=</Encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Dư nợ ngoại tệ" e="FC Debit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99D5JksYEPBHk7jjBP3nNgPjHohu0LllL5AjGif18foZFVnvICR89q4e0dNYr3mpwHyxHgg0QD8GUuMPjObHafdg=</Encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Dư có ngoại tệ" e="FC Credit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99D5JksYEPBHk7jjBP3nNgPjHohu0LllL5AjGif18foZFWakyvCuXLNEt0HVk56O1E1bV15GJmh4Lvyy55BxTEOY=</Encrypted>]]></clientScript>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="8, 112, 100, 100, 10, 120, 100"/>
      <item value="1011000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1011000: [tk].Label, [tk],[ten_tk%l]"/>
      <item value="1011000: [ma_dtqt].Label, [ma_dtqt],[ten_dtqt%l]"/>
      <item value="1011: [du_no00].Label, [du_no00], [nam]"/>
      <item value="101: [du_co00].Label, [du_co00]"/>
      <item value="101: [du_no_nt00].Label, [du_no_nt00]"/>
      <item value="101: [du_co_nt00].Label, [du_co_nt00]"/>
      <item value="1010000: [dien_giai].Label, [dien_giai]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEz3nr+6dX5pTQcUFP2hLyuUnYtTl/UETzs6jTT7VAecFXEcrfc6hc8MsYkIBDVEDRB5k8kIrpI8PtyBXzKqWR4=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvmUJo3D7MPGunQGWeQpLUtwRyXeWSPn0DpdrUw1dGHxOLRne3DwlCWYssI3YZNksn9Qfy7adC1t/oaXiDNNyaSPAYtFY1S2BibPbfrHyJqw+u0UKC5CzKabqmNflQwz2Jbj5DAEkFF8Oau+Ju9bKeiBDza/cMNwypWpCL8W3995JjrqkFpXA4bwDYniAh90J1MSBML+dwlS0SeUV7CR+1JB8U0BaHviwEne03GmI1m9xn2ZkH4t3USrKoIqkmm9h1g+2CVgfy3C/jf2GVEAZnWdjH2V6H1lrWhFcSV1M0MoqsG2ACxk+4sIGPiuEQ0jwyEyh7be3C07UNuBmtaJBOFI</Encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6iunf045HAlkx62LlV5AWXsxgO+jQSuXutHmPb/FvjbxhJuKugEGieteZjk+ax4+ar</Encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNI5/eLgSFSWQShrlktbm+/d5GYZeb+CVUO/NITv5hYWdFQiXX/9mrAznMTaVQTWKfP1MNULrj7KkuvDPb7CW6VXdRpMnKl85vfNiVSGA5JCiS7xlJv5lSvVSgx2VGeubDZzTEPMb6P9t8JaoEWn2Xhlg/NTPguUoc+VthMXS2IRMNgMjFWkW2gJ1KMjkKjgE97</Encrypted>]]>&Name.Field1.Text.v;<![CDATA[<Encrypted>&Gf3AUkJFg+tajSC6Sx7Gz5uDZcYSkZ7VS35blaRnOS0fa0X3bCrCm/RijX52ZCAbApDVPVg3qqDgUkmHDdE5GR0JX01VzOoNGfrEdV+qM5jdzJJKePlKYZaYZ5yDYCvXQ8Wvz2bxGPU5PoGmvfAj6rh6fFP6K9/F/TxN3w+epxSp/OnRFMu7z9JNwjbOWXv84RlLfHpP+dXM3I5ahjuc4Dvgk6Z8dall9KZr5EPcNzbC2pXKfqXuI5f2D8OCS/A1nwDwnogmFi7SOaH0A2AmBVh7MFPV92ljqT3UY9pl3EEaauHPXheIoDfmio1dVXediWwzxC7jpqQFuyFIwanS1xBbMOG1qnuaMEgqGkqJma0G4H5cOtQzaqa+X86I+HFscgKBdjBQNTiPaDOwKkO3cQEztc6qL8TtiOkEKPSnCMUmddRdpoYMtAKZK4R041Ic</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUDxLP0rqfFTsuzurIbfsSvPFsIsb7THjuS07yryEG4lsi9W62XoNnh+hcUd3eZ2LmBSI006BDbEVoGKSewQN9MbENCk3+eO4UqXCbV+1FwbGmGujWufgpHxxResvWocHA5BEe6mfFfeV6oTdqlzfN3y5MIQBFoMHOSc9FDp4eAxwhOXS13x0yqbxc5lYkf1VQf4VFVMOz1VLdfXboe06R5eQzCTPCoKjUoJnpkwfiiY9BKSeIdRUbgqB1MyLa1lWJ</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLmAQB0EFHcPrMyAohnJs+pdZevmaCGoeBZRWzYPDv/aELl61MeearXwl96Kc1k31oqfXbeI/A/4DsIA53a7vyA1cbvZIA/4ZMpufE66cbO6roeG0ubp8tBbd0KVF7cIjxCMCsQlV2DJiKmP9aa8xpvYQR24jiJeMWKtGW2rAoD3mNX5mpA49ZZpHtYjWcmgLJQtsJ78TybtHeEb2G9QSGr0spwtaHB8IH+6G8VIn/HV/+VlUwIw2MKjXCj2ALTe5oe4tH0osh0c0rP6qm6A0QURVda4ao1T66En0oJfgWzi8Y5XOc85jrEfnY6n0eR9IbAk5RwtqDatuUnkghyxlg5ndPOns6B3NhKcxvqA3Grfk=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV7lv1In5cD9YiV4kE7LoPQbXdThKBXBdZMtkcnv5U0y0QDs8U4DNXrSB85tGd5h+s5xSb5uQ0iVO5CUMgQlyWZw=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenBalanceBeforeDelete;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XUMs3+umX6JYSqNnfNTdpQNVXqyN6zirxZWQpKPeUipfr3jQQGZ30wQhYzkgYIIyKVtCx+RuXgsHhRoKe/DPqqFw9fnMHpi8NKxmBnAX1wLqFY2/r8ow3Y7Za+1tK4K+Kb+aGzPumVxUOhpLO64eKTU00KfVyoumP+RchK1qiwyy8TkdI7sJJhiGIiE+a05y/Dmer2ZTriOv+Hezt9hO3r+FGgsuaPON6ofLUfb7h5cWb+8ZtfYRhAIsaEyBp2l/LNyOOzFDfDc4GZloLskiXYh+Ca2vxWlDU+/FTVgAd5LIR/n7BA+P/vxqwB6OfXkdNckQkQkZMY/8OT97Ar9TGA=</Encrypted>]]>
    </text>
  </script>
</dir>