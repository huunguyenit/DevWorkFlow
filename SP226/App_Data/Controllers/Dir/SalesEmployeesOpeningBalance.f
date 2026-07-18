<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">
]>

<dir table="cdnvbh" code="nam, ma_dvcs, tk, ma_nvbh, ma_kh" order="nam, ma_dvcs, tk, ma_nvbh, ma_kh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số dư công nợ đầu kỳ theo nhân viên bán hàng" e="Sales Employees Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowNulls="false" dataFormatString="####">
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
    <field name="tk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="Default" allowNulls="false" align="left">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZUjRL12eta+ls2XuG8Fx/Z4vHQmxlQPQYexfPEpM5WkUdaSeLGtqpYfEUr+oWziMrg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nvbh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Nhân viên bán hàng" e="Sales Employee"></header>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nvbh%l" key="status='1'" check="1=1" information="ma_nvbh$dmnvbh.ten_nvbh%l"/>
    </field>
    <field name="ten_nvbh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" dataFormatString="@upperCaseFormat">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new ="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="du_no00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Dư nợ" e="Debit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpvQJN/ksbIqriTKzmH5qrBJTCu5SWfl4zM8vMYnn0Gbw=</encrypted>]]></clientScript>
    </field>
    <field name="du_co00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Dư có" e="Credit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpbNxUpnLPFYtk5Fexs8kBTGQ8G6UEJwU05GLL2dTWZHQ=</encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Dư nợ ngoại tệ" e="FC Debit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpaCYPG9+MS/CqVmemSXMECo62yMrolwF5+Afd0oKK354=</encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Dư có ngoại tệ" e="FC Credit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpw2AsXz6rjXDexlXZk+W5KJ1gbGPNlrKsiocXd9QlXw0=</encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 200, 130"/>
      <item value="110010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="110010: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110010: [ma_nvbh].Label, [ma_nvbh], [ten_nvbh%l]"/>
      <item value="110010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1100-1: [du_no00].Label, [du_no00], [nam]"/>
      <item value="1100--: [du_co00].Label, [du_co00]"/>
      <item value="1100--: [du_no_nt00].Label, [du_no_nt00]"/>
      <item value="1100--: [du_co_nt00].Label, [du_co_nt00]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5fxQRs3hhLb6tY2YHgxXeak+fjRyi0qbN6dvMHmfCIKuSDOafsft7ApuPjTmH53FNkXlmz8PNUhMh7DW3RICr7sMosIhQniqI2iQEuYT+wV</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1X8UtDmCQxRKhh6aOFgFaK1o8p+L8QMNjoFL84PVBX7mely3y2ac4Iy153G5j/lJqqmkLN3chf+mvGragDraDQG1MPoXIomNTjYnesiZYXPypTagNYJcZW8yPjQ8gzaYkEsWxZ9RDnNKF/Hsd29M6larj0M4X5kjwzju9Lg261+yjdiS9X1/EyxmYR+pKcv5U/YHlkhqaYhhAoCS+fOXlcmJ/kQlNrs3cKlWqnMytXXWneNIeOzYMwIoHKFNjlMpKIz0+zdv2dcSYrwHRu6N5QNpI5HhLNmvYDtCMiOXeYFMcRyCV/DhrSNCkdaidLm+mmg4KOrVqEli/prhdDK+p</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb1W+i4Yu2FYMddmulhaGEZweWNTPVBc9T9b57+xGNYOZBxbQu5w5Vt7mjkfA1NB2gft4D4FQxXRZXtuRtx27+c</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/O9XOE5YvgePVJRB9A7sa6tA/xPp6MLnPb5DKJcUkwJ69xz3lL5IJDyT7fyy3pW2v7KbTKg55ZyyVyKB7+MSp3CB6ASDobVIkb+huUfBjTX</encrypted>]]>
      </text>
    </command>
    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulisdn1gPaxIUXjDlGlcLxpQFkcW+nRLZyhTVRY8F0sHlYS8Qj8++kbwr2uc6yiLbEztWalc0cFbgJv5eQiQrjN0tRSqeidiump4kmjLPOWTQN3sZ3+iH50JpzL0eXj13GKcrYZjKaZDmoV21raUbg/GPd/eyFpEzA+HWrFciEsjdsbsd+jX4SBVYYwzXJwdysNQqWgNuTRgL8XrW1yvgwhvpzEGjAqx99ICOGxPbwcpUyCpmpI1dK3b7tx/ppljvl6V138qObN4tfV55dgqv6AuD5aNrIZ7bBn0MifKUvtPmBki9rIljml8Ag6ci6Gy+XZlmxT49gz8fKe5rkOcAV3X3gUmHXHPhky8Nsx+X5PRDVZ5Vg8JPiluq+W/vzeB7mBfh+Yx/F4xhO6L98R9schstdXwPkEp8kvgY0G2hAwHCWijF2kb9jy8ZlNE6RmoHx7J8w61SnU6tsPmjaQ+UZHHhFcYOtaA5Jz40PRer1D6Zs=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cz5qm65kDSH6N/uTFzPCmYZCx6j1p6tB5V30P3skoV111wno79cdinCjx60qwLcdJ2/JVxtIVb+pIwW4//XJZB+oeMemTJ4sFZ+4LoqeW8+SNvd4XxUpY6LDxTBLcwv7hfeJosmyuGWjde4tNFIb9EZ3+FuCrGjEQLN0dWLwv2Q6mus8Pi1UdVxB9y0WMRwpDwoAsASEcx34TcweO0sRNnq0DMK7UlAJsjZWjurQ0zPDuzDRGKku4LnjdiH2a5u+B</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBqdxKyVHbMFGSgctjyato7AyJeh/IE+iKsOwLz0SohdLGIXH4c9QI/1GHUNl0HPB/+kKj/KffIgVtqBZiNRF2X3vXgFfYtQRf6t8MRXwsb+W67XP+UR9fE0zokE09cvDMQfINKdpq0ufeRc2w0bjZ+2Z9v5bvch8jGHHSKrs/HvV2w0BsA0vqNrs2f0pQfq0CwUixmpdRM/DGKsZYFmFkD+1kT88vYS9bMbgph5THduEp/e8oeESGTsRdGslZLraJ4gPjKYsVc3h/aEYVvK9wuUaqUpYG8gnoubTz/sMDC8SoDmCSB084L8QmdEFdRVy/PMNF/WTUirspSouLywQlKdaZKv3ujzVgEoWa3U6Wx6N4dxJhLYNFyKK1PywtuACWBduhXvkl4mJhH8mBBp/76A</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbev+SPD20ydJUl3KFBhnojPALGQYtc5fkJSUdQNlPKpN0vcbsKjGDkZYLbMpU79RtWvxmO572C6zz4RnB+AyhHAc=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FM8YnOQuI8ZWnSCiEF0Mtn1ib24v+hX5zkHVfMzZBp8p4bYJWt+yqFWbwtPfRTz8RDIghylJjGpO5+rL91e+ci1llP2fc3WavFohKZqFSk1CG3sCGoX+81kqlwVpJDN/yI1+X6mcJ7+kpO/deXSLnIhlSWviVLPQJvfDisw2Pjnart4zX03A6KxuW6KxoiAaPAuS+Kis2ZpJWBGUQzFDVa0JCu3UAZnbK3oYEr3MmY2B1uHuZ178RQmH/KWBkfU/PxYw91cQurKQCXvyzsxb3EHJ2sxdYybebfUyOXR6mTs3Pl9K9aM5YR5i9iHt3i4xAcx6bCYoPA3kq+AMHG1rAE/35InnDImu5UDLezkFiAy5NWQ6EUtmwxGBgxCAFNPohdn/QsudFYfLlTvMW4AaKbVI1xXeHKZCDcWxbh1MwFuqnNY98h3URZ9722vTzYlKCmZ0kgx6BUbbZZFcRIQm/VwQcuNFQDa1TY6KXAiL+R8eofUJ/vshWmyNxQSdY5yrMtIwoi+7pbmSdkiugG1SVZeadiRr8Teh9Y0roIReYTAL43OJB7wUfgGEineipXKuM53SZQALLAyCp2N/azFo9ZMPtmJiodCTZg+f6/7hnfAWE8rtRBbfYS2Fonapz6ug6LEywL+u3rko0/xYA3qEHAR4BE7VVnkflVFmKb7d1Cz8EhkSrGkoUyV19sNgCbuQ3R7f9wkBrFEBmE4MZSy4kwiZtr6DArq1VstSSuM6rd7MZbA4GDrMeTYunF+h651ErHszhIVNQVMYUWiIkUwIOIvhSwC4QwlgguAT7Lrzn1WWovTqWNeqlUadxgBMFjKtDX6CVtDRbxFQ0Tq34mJ9G0Im9XCCEO6J9HbdTPV3TbtG1Sfja4eIu4b3wKYdlSmB35GFOoUYse+ZnDoqxyx/hfLq8O9P4oDcDB5KS5hfa8Z</encrypted>]]>
    </text>
  </script>
  <response>
    <action id="GetCheckAccount">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Kg1AS8A+6t+RH6cNnnuVtzwmwtudcIoMMk2nTkVJ2E4KDeyFSFiABZSnT/VmRlxXhTDZDPgI4InxAOmFbW9ahdHfSEj0MnUxgWPIXCECUtvMiOzRjHfkV5o4l0EZ5nJHQqwE/TrRuCZ/rxYRjUoDNKc=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>