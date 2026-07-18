<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">
]>

<dir table="cdku" code="nam, ma_dvcs, tk, ma_ku" order="nam, ma_dvcs, tk, ma_ku" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số dư đầu kỳ khế ước" e="Loan Contract Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="false" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="false" align="left">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ku" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" allowNulls="false">
      <header v="Khế ước" e="Loan Contract"></header>
      <items style="AutoComplete" controller="LoanContract" reference="ten_ku%l" key="status='1'" check="1=1" information="ma_ku$dmku.ten_ku%l" new ="Default"/>
    </field>
    <field name="ten_ku%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="du_no00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư nợ" e="Debit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpvQJN/ksbIqriTKzmH5qrBJTCu5SWfl4zM8vMYnn0Gbw=</encrypted>]]></clientScript>
    </field>
    <field name="du_co00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư có" e="Credit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpbNxUpnLPFYtk5Fexs8kBTGQ8G6UEJwU05GLL2dTWZHQ=</encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư nợ ngoại tệ" e="FC Debit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpaCYPG9+MS/CqVmemSXMECo62yMrolwF5+Afd0oKK354=</encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư có ngoại tệ" e="FC Credit Balance"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpw2AsXz6rjXDexlXZk+W5KJ1gbGPNlrKsiocXd9QlXw0=</encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="111: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="111: [ma_ku].Label, [ma_ku], [ten_ku%l]"/>
      <item value="111: [du_no00].Label, [du_no00], [nam]"/>
      <item value="11: [du_co00].Label, [du_co00]"/>
      <item value="11: [du_no_nt00].Label, [du_no_nt00]"/>
      <item value="11: [du_co_nt00].Label, [du_co_nt00]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0A8m5tLHoHdAvUAjrQPDTC54yNDeOmynhIDEa2CpY8LRzmFEZWirnMS83cWUio88ed2EmiDC1IXluQHkOwncOo=</encrypted>]]>
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

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulisdn1gPaxIUXjDlGlcLxpQFkcW+nRLZyhTVRY8F0sHlYS8Qj8++kbwr2uc6yiLbEzQ7q/xng1GbEHpVNFVsK8Xkha1vdXj26FOgIrrBQxJ2wG8THsDxvrPGEN6eyDbPRzHwco3pbWExiTTYcRpHrZ8l3Gl030Tfw8iExGBQTMnzHIAo3VUckF+M2+AA968v8ET3QY6Jg05LKZDpLFYma1MAeZSwVu83wDBKzTXMmrWpQwTNRTRk32mndUNZ5S8FqMZMXYtp5qCCUwXKZhIb5aq6gr8Shi79ypjqajPCbFgfEy1VFgRI0Yf+XxHQ1lYlpPUxrM4Y5Zz/CKq7rEsSPrMopqaqAGgpcuxRbliEmdt+yoHI9/F3BZPXDFL2wdXDSrKU2BIi13A+tUcjGHUp8BR6qsj1giyWevB1iwqo/ovpbWw1S3tkuSPTIqP0cjcA1h</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nFJssn+cBPm60rXisaJgw0pBQsnUwrDbihcF8Kltjuc1WCIJA/1YJX/exXlLsXp2xIDwpLD36br1OB8kXI0zz/bUYyHwLIoU/KpUpmsVLhFnbZNm7JE7nPCqW5kBV8dfhSfMZyC/JIJ0B6oaBO06FJFLO+z68/HlVo59HBcePN+kWlNnZ4SvpH1Im4SrPQzqyRgso4blMtKMw8anymfFquorF+n6XVvqUHFbXOhW8eYcG5odPhqfpwiFt0JGA5wWS</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHbjveXsmJ4pkjBvMl7kGE7kP2kikplDWg+IbwxCngMAVeVwTOkQuUm4iCEmq7oaRQX18D3R6qvrHXfx+hpo+HdbknIHAxwHk+ymJFhAq3OKoZEqvNzGX8nAGP2veITM8ypKAba5kK7WkXepyh/2hh07lrLHWVqkGHa7kv4Hma7minqUndc9q+qryiHxGWy5FfaSBS2I4M8T5IplR7UaTlcn6oDleLGgUTd0UPuQWKl0zbvS00DSNh7ZzVrYataTw3Nar4ozk86GKFj8bC8D5JDhHOO2yoC1vganNy/LaNVsXLEarHG3RsQdBHZLBax2WJXM6f4Z95FWqGZWaXBTNKI4ht01VllG4CQGavJjqQ3E=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbev+SPD20ydJUl3KFBhnojPALGQYtc5fkJSUdQNlPKpN0ETk8Q7zj9+gkdSoDzNVB9lzPHkSCpGgiDxNDoQ8gqtY=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GOEIMKqqkSoK9gqDO/lshH0UNdZxvjw4I+evq5CnQEnmPo2VXMS6/VPusv6vUhw96+9A5dWx6C3NOUqp9PmMyBm+kXjbbUrH+wdyjRiln8n0Jl9/y+jZAXRoksxfb53yht2P993BVtuDxuvxLiLi30swKurZr9qfrFWuCdh9460T/DfMeDRYTHQiNcGhhr4P0JGOSsoU8gKj2Hj0Fa1XRYXcCaZH+XvYf6BJ72NvWvy11ZzASmaQ2l3d1A7uvcAzBC1mqbmDppw15U/Bi6W/uNVEzVGpcYO5UJ4jSjSgI/cPCySJD1WmRTpBZcQWAXOc12VlsfCOrvzjs5+mmdNGmI3BUIkDBkbaKqeunxpY1miy/ASZdqJqcAySGQ0Mox8ZA==</encrypted>]]>
    </text>
  </script>

</dir>