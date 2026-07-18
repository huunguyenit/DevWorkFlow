<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">
]>

<dir table="hrbhlddk" code="nam, ma_dvcs" order="nam, ma_dvcs" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin lao động tham gia bảo hiểm đầu kỳ" e="Insurance Information Summary Input"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" disabled="true" allowNulls="false" readOnly="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" disabled="true" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ld_bhxh" type="Decimal" dataFormatString="### ### ##0" align="right">
      <header v="Số lao động BHXH" e="Employees Joining SI"></header>
      <items style="Numeric"/>
    </field>
    <field name="ld_bhyt" type="Decimal" dataFormatString="### ### ##0" align="right">
      <header v="Số lao động BHYT" e="Employees Joining HI"></header>
      <items style="Numeric"/>
    </field>
    <field name="ld_bhtn" type="Decimal" dataFormatString="### ### ##0" align="right">
      <header v="Số lao động BHTN" e="Employees Joining UI"></header>
      <items style="Numeric"/>
    </field>

    <field name="luong_bhxh" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align="right">
      <header v="Tổng quỹ lương BHXH" e="SI Wage Fund"></header>
      <items style="Numeric"/>
    </field>
    <field name="luong_bhyt" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align="right">
      <header v="Tổng quỹ lương BHYT" e="HI Wage Fund"></header>
      <items style="Numeric"/>
    </field>
    <field name="luong_bhtn" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align="right">
      <header v="Tổng quỹ lương BHTN" e="UI Wage Fund"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 330, 0"/>
      <item value="110011: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l], [nam]"/>
      <item value="1100: [ld_bhxh].Label, [ld_bhxh]"/>
      <item value="1100: [ld_bhyt].Label, [ld_bhyt]"/>
      <item value="1100: [ld_bhtn].Label, [ld_bhtn]"/>
      <item value="1100: [luong_bhxh].Label, [luong_bhxh]"/>
      <item value="1100: [luong_bhyt].Label, [luong_bhyt]"/>
      <item value="1100: [luong_bhtn].Label, [luong_bhtn]"/>
      <item value="11000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+zRNoeUZCnqfxhDDN1fyjy2UflGwmmpgw9+PpoXRKSFYZO67JjFRmFULyDKEwu10VrHuCwRhJdmfrQZjedbw4BI2NKJYZHIOJqzOskBPPvv</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZgJkw7M0ADa6mad427RdoukL0JZvb+AIv9MlXwuDspuwWmw9gVP8Q7QduLYGRzwagE7ibGUlWPKiNW5wMEtnIug+J3LSdyvrZ9YaA8TJoRU+wTGWNjnijFfcxg/zwmp9IwgEbzAueUyIn4aXUIP3F1My+K0RiZobC/bpl1ikNsBORiFt8cA6gYEVi4Notvmj8v0OUleROn3C5n9ZtjrzjINJmlI6XHBKIcTVf8amDotmBYNxDJlwwu+Bx1IDrX+fNWWFpzpl9PSeoiat3+1jHSnn3fpg7SWA61dbCprXerJdg2yWqOZ1IgPm6mCUl00/mtHZwAtFrQPJ0KBaCzogat7UJGKTE/NhYCt562bE3W9g==</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOooAOfc8iZJcFBzlffSKW1KOQaKjVQHvC/KLKIsAzwtKt4pYUvGk4AP/2D8iMQ/xr7FVn3f4Tvx46qTTPv8//4A==</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulivDlk0rPC3qob/iWX3ePv5I7kCMb6uI9O0aiAlMrbRcZI+v1ij4lcCbqTGi5UIav8AFtxoi72ZooBrKF0IzdkxxPEj16QqLr0CzxIDYUX9xDU1WBOupSR1B/xYnzPayUoLJKEJ9rn77iEIe9rK/PfXULwnPLU4MOb9zq8e9zwZpMCsibMIOYXVMM2gFjM3891+C5mjbNjwobKb9ihnTcgz0TMbh/wHH6QsRBQVqMMIipxFqhJKERiWQVb9KvoW7FiIpIS+pPtD+TFoVBHT2ngD/oyxWgebVjSElT6/XaStgJR+KVmxT6I86Hn4rZxZfAyI9D9sCVddxkFd6PEJ+2pQZiebs+u5vwSUMJgO3oVCI6b9BSTk5mx+b1VR1O9OnxC76z9Zw2rLti8ZtzG2zf01zOXFKjOkjlUacAAKqFKpTpia8D5br4fwXUwSz3o2xrN</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nS0Ignx/uQretofeaHgl1POMBhdJfu9JNa6+OSlTOxVoBb+IZuyAae6Yhnjp3MF+yy6j8IOYFpGyO/UQb5wc33UAADLhCunoDpR6mggJV3de+sNp47Uy8p4J80ukI3emE2qYHAznXrSI25NdEq5pJWDMWsmmr0VaRzB/M5xi2NR0JX9NUJZsapu5MK69Tv8Mtb7coTD9BNhr91K4mmfFzkYXuPmltERq4s4zxoWR0Ozk=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jPX+9//UVyVOvGC9jzOM6owXXKF2kg6MF5unCSLP/tub+yFVb5C22OY5WND0RU6xV1HpReBmmh5Dh1KBfb94aDrYAisfZkjHFDL0phTxLnUtVQsSB5T6rxDVqUSW3NUlQUwcA+fgTXfhd9ahpmyqNBluY5gZhv2sLnUU+i6+YEE9cyj/Cdlt+AyaZTTx+loXlXtngv3Pvdm1R0LtouO26OHyOcoLH+Azb0PwbZAqHfCJVFwbURHvzI0/BBbVlhQJjzBaGWU9hWuXtGNmVyIu99w==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoJ+DOf3ngC8YWY8utprm/F4TW1C2sB2j+U/fMmn9ZHbcMyoZkiWC4O4kHN3jcBGMw==</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FT9bC/F05Xr1qdlSO1qjmc1Ca6F+46iKU8rDI6lc2mpSOtUfDkvWXVu/LnrEgFvf5B3YyCmXq9Lp6atRRsSWryfiDSlFG5Foynst9ZebfIp/HGz2a+fWq2Od5MA8pJWSxTLUOz3/UfHem0f9CZjwx6DO1D0j8VC6/GkpkoN4KnJkrfQ2nFG/oNelyp7YB55WUBKcSNs/tszuQuKgyu9om9e6hl5WXDYlS8PSq5ffFmx5l9S4YyMw08KOKCie1bejSdqJXYq5aI+yCR7oXEwelQ=</encrypted>]]>
    </text>
  </script>

</dir>