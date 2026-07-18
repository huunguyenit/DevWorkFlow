<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">
]>

<dir table="cdvv" code="nam, ma_dvcs, tk, ma_vv, ma_kh" order="nam, ma_dvcs, tk, ma_vv, ma_kh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số dư đầu kỳ các vụ việc" e="Job Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="false" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="Default" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZeDcu2emg+NGFxPoTDT/1IH4FbON5F9GumBCkBY/Pm/R2p1A9HURB1ylqV+oCrK/Vg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status='1' and vv_sd_pslk ='1'" check="vv_sd_pslk ='1'" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" filterSource="Optional">
      <header v="Mã khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status='1'" check="1=1" information="ma_kh$dmkh.ten_kh%l" new ="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="du_no00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Dư nợ" e="Debit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpvQJN/ksbIqriTKzmH5qrBJTCu5SWfl4zM8vMYnn0Gbw=</encrypted>]]></clientScript>
    </field>
    <field name="du_co00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Dư có" e="Credit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpbNxUpnLPFYtk5Fexs8kBTGQ8G6UEJwU05GLL2dTWZHQ=</encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Dư nợ ngoại tệ" e="FC Debit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpaCYPG9+MS/CqVmemSXMECo62yMrolwF5+Afd0oKK354=</encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Dư có ngoại tệ" e="FC Credit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpw2AsXz6rjXDexlXZk+W5KJ1gbGPNlrKsiocXd9QlXw0=</encrypted>]]></clientScript>
    </field>
    <field name="ct_kh" type="Int32" width="0" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_cn" type="Int32" width="0" external="true" hidden="true" readOnly="true" clientDefault="Default" defaultValue="0">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="111: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="111: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="111: [du_no00].Label, [du_no00], [nam]"/>
      <item value="111: [du_co00].Label, [du_co00], [tk_cn]"/>
      <item value="111: [du_no_nt00].Label, [du_no_nt00], [ct_kh]"/>
      <item value="11-: [du_co_nt00].Label, [du_co_nt00]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0A8m5tLHoHdAvUAjrQPDTC54yNDeOmynhIDEa2CpY8LRzmFEZWirnMS83cWUio88ed2EmiDC1IXluQHkOwncOo=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Zo18T74GWv6/p4W1SujlXYpn4Fwf0+Tefxss3dzQrUT6cbdJb/4kJoGhG9bKU1/+pKdXTb9HR+96rs0IzgjGntInNJ8VOEENQKciJ/ozPootq0Az7zoJaGVx2ZT8zCQUIBfHScC5DvuQ2YXKYek8X6IWTVBe4KBWwxmDbFUw72aHtmy2VzMKXcn2iV/r5VCKw==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1X8UtDmCQxRKhh6aOFgFaK1o8p+L8QMNjoFL84PVBX7mely3y2ac4Iy153G5j/lJqqmkLN3chf+mvGragDraDQG1MPoXIomNTjYnesiZYXPypTagNYJcZW8yPjQ8gzaYkEsWxZ9RDnNKF/Hsd29M6larj0M4X5kjwzju9Lg261+yjdiS9X1/EyxmYR+pKcv5U/YHlkhqaYhhAoCS+fOXlcmJ/kQlNrs3cKlWqnMytXXWneNIeOzYMwIoHKFNjlMpKIz0+zdv2dcSYrwHRu6N5QNpI5HhLNmvYDtCMiOXeYFMcRyCV/DhrSNCkdaidLm+mmg4KOrVqEli/prhdDK+p</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyTPBwiyGfpcGWF/oAKZ5cj3c7dx4Tl1OwL3kw0n1e694dsx0M3StF0fb7IdzB3zpw==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOmf7U01vaOUFYyufwSdHK2W6CCn75vubM3YY/KtPc0qx33OMOlRSbwHdReWkoGS+4</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulisdn1gPaxIUXjDlGlcLxpQFkcW+nRLZyhTVRY8F0sHlYS8Qj8++kbwr2uc6yiLbEzZTyhv9D4ntOfeK2LSw+8d2N0s45nrMWd9cF5VdNeHtt/Im6m6Zc7/YVsR+XZekThe4syVJ8wizHvyt+PpwyP8SUpdDHzyb/D0J1+TwdZQR0cF0zRcC5sNznBhxLmVEhYFIHXuZaZZIMSn3KfEIAvY5pzhVz/WJfKcYdqvaO6oIA93nc9800+6EazAA/lhc4COqXbre3r7k54VJsZh+2OFO4FcWRHK/c74v1ewkZfNEKB7gok2WHiYFzLS2yTpRWJN7BRz9CVkWBu8amhDy4lYDqF0xqyzbMeC7XqMWmMblwWZ/MwlvHsrRRIkUmo4Ep9FsDUxQX0SmzHZ0KUO+BpHFpPHkLG1hMpotr7L1hDLLQ1K+oMKyBX2vXbZ9mNeMIwUnsZiIHzarRGZp92oZFuBA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nFJssn+cBPm60rXisaJgw0hcBUWuBNAwaR3OSd47hHMHAyunFFekkwD/t+VsrG8ycwhBl7mzBbe7+cmIJ0q97Kd9UQQSFB7KhiHTAvn5XGySfQT+NfzUnFiSQZLXz2YGDsnM9QVoamR+bGP4JrFF4AQpRNbT0vAF2RaYkcUV1YwDqIwAAySIk4Oj/CGvgWoRWokDaMJHYbXZ3Jdeb4UuJv0i+hD9wNjMIsbfFzhjRL9LVHJfGyKtV5L1IyGHX/ixq</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHbjveXsmJ4pkjBvMl7kGE7kP2kikplDWg+IbwxCngMCsvL7b4da4DulCDq8CFg0zV6691z29IAHSB2IC1BB80EQ6deasKqz136DgssezXaamkKBEg6CqF0PAWqz/ja1HdbEbYWNS5s5OqCyLYxn7kxfnmBLXd1ZWeTJgthzJvHm1bThVDTcAR9jwvP0m9OSbKwhonUJnlukBdVeLhHKYJfkTc/BzRjUvhCG0C1yF3x29NAx+3GvKqwrFvNDHSkwTfji3pzsLRImfH7qZ8IzGjl0VOlza5vGrn1dgF4NQNy1R8NdbRxK1ZVgbYXwp7Dz+zRNjEVRxsgtTuwcV6L6eopYO8WW/xDHge2tn77XRQCsk/YIzy3/6pZ9EqOPrSwBb</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbev+SPD20ydJUl3KFBhnojPALGQYtc5fkJSUdQNlPKpN05MELGPFwFeNxdG5Z/E4IGvh04xcOrKUf+Znh+C6Tt2c=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GOEIMKqqkSoK9gqDO/lshH0UNdZxvjw4I+evq5CnQEnYGcdB9WqLDYhturBYwD6vB4fR8qsIWHZLZevp3ehYX4QoocGWfwmwNoFgkWee16PG4ZnudI/woKnu+IFzKlE9UG24zTMkN3pbpJ5SyytYiRagVYEw3Pzs334n+naCcwCPlX5go/wsqAZFAl9KsYmiXJg6VePz3grYgW4nw5jJ2nM+Ss3EQlHh6oFV2TvBsSpOmjYGQ23xHxTcwcL0EL6c28AiERVplLbqwlXzgJgyeyEaab+t8pBAQWHVrJnKRDQiiZisHft/irZ3MtqbMFDZktj0Lq2rj/bv+BbPm/6JqxEFN40m7HQjQi2NTRhLOlbQ3GOppFmJJMi4SzzUQq2+iHYnI230rUbhCeLmcj345jnjtgEpqcUa9+XWOLjTjW/DAoXrSyYWKFz6+9kpennP2fYvyJ7FX79gDuwAu3p1gVRkO/UrOHUPIBdiZzzvr7jX0PgvbiUaVTkZiTNT7ljSBkeVaOELxnl7m97wEX6Owp980M/nT0RC66cWFkiYwZV3VFpK476DfSyYxt3qxdZPUDa2yKRSV+1F9YaZPQ/JfmOQFr+0It/6LsX8XEOOcKiFVk2J1BS12QrWMxmagP00JsIC2YkPhmJlXW7NoM+TbyO9W5VwQ9vL5O9znRwhteHtxO1ZsnSokfhk8jCodM/317PrqqHZKFjp695Y2aR45O/MiDlLLhBPP6Egd8BOdpthw+5gGmn77XYkyQRBeSbba47F3ps+NmV3ctHeewbHI3mdG+YKOZsv/gTUMm2Lr7q2fEVNFvTHjhwYaxLgBt9cNUFO7lfAleNPX9FI7wS/SMNOVuVMlhnxFSewxsPwrOJQBlSAbVMRVGmWqhSoPFyhM+sSnymwNCj12iomGGOYeI=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Job">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK62HIwNtjpSgE4K+qiMmBeoT6JQ9qV/W7/w4nM6zBP/IJPuf8bfJtkkmBzLkB5QCtmmuziE5fhGz3RU1Y3zvbsZKzq8NLzGvASEv9ACwaw9ag==</encrypted>]]>
      </text>
    </action>

    <action id="Account">
      <text>
        <![CDATA[<encrypted>%mQBbBFgTfEt0ocg19IHrQWNAv7HxbLi/EdyV6TmxHH6fIhFAvlpg6gP5Vya9RKR7BA5sPkDan8ZUTlAT714W6C9khXDktbyI9tsE3qs5DdhW6ydGnjmeSVswpP7uwHk9lgEypDNmme+dmImFdQnAOA==</encrypted>]]>
      </text>
    </action>
  </response>

</dir>
