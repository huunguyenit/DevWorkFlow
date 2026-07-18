<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">
]>

<dir table="cdkh" code="nam, ma_dvcs, tk, ma_kh" order="nam, ma_dvcs, tk, ma_kh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số dư công nợ đầu kỳ " e="Customer Opening Balance"></title>
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
    <field name="tk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" align="left" clientDefault="Default" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and loai_tk = 1 and tk_cn = 1" check="loai_tk = 1 and tk_cn = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l"  readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowSorting="true" allowFilter="true" align="left" allowNulls="false">
      <header v="Mã kh/ncc" e="Customer/Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check=" 1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="du_no00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư nợ" e="Debit"></header>
      <items style="Numeric"/>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Đầu kỳ&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Opening Balance&lt;/div&gt;"></footer>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpwkebGVMt4XyuksMVZ/gRzS2ACtIv6Ri2rY5aPln7IEs=</encrypted>]]></clientScript>
    </field>
    <field name="du_co00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư có" e="Credit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxp99prrdjZgBigRms+SKGOSM6baG41P9iS7Iqss5BtbD4=</encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư nợ ngoại tệ" e="FC Debit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpHddPizvW4+dDBV9DzG0ey9184V+4OI/I4b8eL3VhoesSntIr22M7YWVx92jOZkYt</encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư có ngoại tệ" e="FC Credit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpTf9nTApFhrPAjRLfnRhCn2QOWzDxsEMMPuF5ZreJAzWXnhUSp+fGusKq3sNIFBqA</encrypted>]]></clientScript>
    </field>

    <field name="du_no1" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Đầu năm&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Year-opening&lt;/div&gt;"></footer>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpIX15gj4Vp2WTGcG7SxWiDljy/mAzYQUXQ0541OrohxA=</encrypted>]]></clientScript>
    </field>
    <field name="du_co1" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpNI88pAFnGE1gE/AKIbTHkBykHYvXygb/sPsFP1UW59w=</encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt1" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpLnqX3wyfbnjRxr/vjY+bfglGNBGQv2JMQimrmjNQwo0=</encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt1" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxp6pY2rIwnLeY0XKErsMQUri5/cGNen8Bnvka4fYBxVUU=</encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="8, 112, 100, 100, 10, 120, 100"/>
      <item value="1011000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1011000: [tk].Label, [tk],[ten_tk%l]"/>
      <item value="1011000: [ma_kh].Label, [ma_kh],[ten_kh%l]"/>
      <item value="1000000: [ma_kh].Description"/>
      <item value="--11: [du_no00].Description, [du_no1].Description"/>
      <item value="-1111: [du_no00].Label, [du_no00], [du_no1], [nam]"/>
      <item value="-111: [du_co00].Label, [du_co00], [du_co1]"/>
      <item value="-111: [du_no_nt00].Label, [du_no_nt00], [du_no_nt1]"/>
      <item value="-111: [du_co_nt00].Label, [du_co_nt00], [du_co_nt1]"/>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1X8UtDmCQxRKhh6aOFgFazLI7cXSlRx752hEPwzdvwr3+i8ZZYlmy4pRVXaGoDxsqM3NVqKMA5rQGdsrd2LdqPrwLs0NOVFDwFhz5p/5IR4CrnCGF6pwCXdrdAGsTRf+TFSXwUwMzAQq7WeOZYyssyeViqH4X2PQlyowMW6X4qZABxlcYjp2TIpuakfl7yIqvQmLuFrCIn/cE4bWG/6GMQ9WhutwpZ06WH5yQyISTl96WkNkNzZjRMGSTWfZ9kUZJvI3CYVOD6pVhH7Xo5rhBmZGoDq6SatLah5JSF88m39Z/QuqX/EM32Eq27jiYwcJgLGjYYjdUFnB7JDRoKxLAlQqF/jFfwHsPShgPZa1VkNJjjN5YIKOsRBuMwapvZHopouEXKXN11kxM0bcCoSptOIEkFI6AubsAR4xoCDxd4vqK0rNAwJmkCBhjdIuCfGFzFJ4k/FP2/FnM4TZkLz9v8PJvE+0F5kP4zm12sRnSlRQtIv7plVBSh/DB63+laVnldXqz9TG4KgEi/cd78HhgEIfY1ficeWuuPNr68s1EOQ==</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOmf7U01vaOUFYyufwSdHK2W6CCn75vubM3YY/KtPc0qx33OMOlRSbwHdReWkoGS+4</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulisdn1gPaxIUXjDlGlcLxpQFkcW+nRLZyhTVRY8F0sHlYS8Qj8++kbwr2uc6yiLbEziV+c1mj6rU5W+o5I7XkJMn1LS+h+X96GQ8rjU+g7mV8Qp6cRthIrn/7hKFrdfCPWHulTUhBDZSPh6RX2wOJYwsvj3qh/K943nnB7vzTu/m+kfbMDVy8IJLHxgn4hQqnczl2pdjQSJdSF0zCfjCCc8SjX8YvULiM4JqC7cra/pevp1UZK6zqVkwimvjHVrnODtb/1xcjW/PFPBvq1mNng8q00ltPCeWxDG/g4hAyZs0InUVMcPrn5cNstoQmViRvMtA7tJZZzF4H9SYHwiyq1FCyvI1LwQS++gYPenhwqXrMThIQPACGiX/XfMdhEEoFIEs4urGmUxtcBp1I+HGiFYSLtwty/on/s0L7Y7zUes4w=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nFJssn+cBPm60rXisaJgw0pBQsnUwrDbihcF8Kltjuc2pX+mX+/J5ef6jtRPrOPSh1iz4nhuJ4HTPbKcs5PYNdN8T/5G3SJobLzoen0Kj5WXlrfLE+L/3W9psyNSETQzVl06l0S9/vyuueY0MCKhI3l2Zlr0+aeLmXJLha9g3V8+RX7FDKbNdHxUYnuPV9qqPIhDj5JA4MVZcJVTQihmcEGlalBVX+BzUR1wiF1YUs25blu7du0XjGlYFdzme7Bep</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KmRo54ol5vOnEpdrVadgaudPllJrIQFKbo2h8Tf8LMeFazc3Xpf1ICmInXmxlAU0QnFUrwdtehuNXJKxgrmERPupkD21FI5JjIZ130Y5cBIGvTyepSN2jBmpMCAlBRgfAHesrnQTEqbGwQkBmd9wZMfwKwjoV97PqyLfxqTKs9FL</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHbjveXsmJ4pkjBvMl7kGE7kP2kikplDWg+IbwxCngMC2cCqaRWwFZQu4RoVbw0mC5cQZvdM7237skryiALRMA9osUtyTpLD+WS2l+WZON1o9AM0MljFGIFNY85Y6oFvOlifABSlES1It45yZZGlqqZevxRp9G5YcvaX6ETmsviq2OfAMRUxXgB3/z7lkt8Ys6HJifNaYOtcCvf4JheBYMo6t8Uk8+npFzIRYhfGwEZLYfPhv8aCs+wIVcj32shDxUqbYnyqIXqcB3HDWXrAzQE+HSlOLJaq1Qh9RJ6WTWV49/hmX08SjFSZIZ12hNOj/Uc+ZA8aETgIIIJpHzs7e6gf1qX4BCUS+0B1QoKl/BU5yZMf39TmqcsGnnnl8sLWcPrz/CJ+p+9ux4Zxj4no3dPTEv5yYKsPR+ggZLMSQWKftxMdpMXgoY7ZyQzBiWGpI</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbev+SPD20ydJUl3KFBhnojPALGQYtc5fkJSUdQNlPKpN01YF6Jn4kmmoHV+S9do7rl2dU+Yw4ahIBFmiqKhWIFskVYx2GRviO2zvfpL4MC04zSHHTY7Guk+XoFVvWnPq/pP26jwl7H6tMbbt57ZlpEH08WmrnOzdedWNiKH6SxvE8OkmHY/tJQ8zjFuK2RVAbRur31uEnMDEgcT91L+vhaTxKI4GNKNMriQu5VNWzPR6jI7yK6k+Tw83ieT5NRDN6EA==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenBalanceBeforeDelete;
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KmRo54ol5vOnEpdrVadgaueGl8f9UbVHsuaVL9tslBpX3i2SkdAzAW0Uq52r27UstX6O86dhbIqpMY96GZIGE33Rn5UNbB91kWcUD35AHHJNCa+Rx0hhE9hNbsj8JkmnSzF/rGN7Iv64W6KW3U1+jS8=</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KmRo54ol5vOnEpdrVadgaudPllJrIQFKbo2h8Tf8LMeFazc3Xpf1ICmInXmxlAU0QnFUrwdtehuNXJKxgrmERPuEBm7cqX2vaWEdNbJDFfwQ</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GOEIMKqqkSoK9gqDO/lshH0UNdZxvjw4I+evq5CnQEnmPo2VXMS6/VPusv6vUhw96+9A5dWx6C3NOUqp9PmMyA0mM+ew6Jha7TiaknVrqJWaGi0mJpKQXedtdslPc+EM15XpzXnahKYPBLs7p/fumRK60uRhJgx6KW40eB6ehxHFFCi3PKn9vx403TMn+a8VCHy6MSmp3zKQOGXVbyNdsPtmel54B4/+L7h8ayccDqyBP+88kg3s5TOXJWQcNJXtRZ4qfiohyViwPqyS6VK/wM1BtiRYG33KfUTxkY4S1tj1uDqLGKI0hMgSCdc0HhzmLZFstBPBg9pehshYm1GdM8iFdwlYDj1NROi8bJWScOlme7E9rAoNPEOwU9r+iiR/fOHHFt7KfzOwe8wutybBtXvv3fUm18YFPkyMZG8Mkp7hvc7s2JaaywUFaq8TGm7A3ln/a6zHGSEtbLbvMg8nsgoYlIgWrwlAZE4nlYLuVCG</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5uy1Z6N60E5aB6/vlhUbneiIqSIPkUa76CQUQkeLAQdisFq/w0AZv7Ufm1E517NsC</encrypted>]]>
    </text>
  </css>
</dir>