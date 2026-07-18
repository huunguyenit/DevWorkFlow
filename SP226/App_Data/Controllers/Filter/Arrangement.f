<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "Arrangement">
  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;
]>

<dir table="freefunctions" code="id" order="id" database="Sys" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc dữ liệu" e="Filter Data"></title>

  <fields>
    <field name="id" allowNulls="false">
      <header v="Chức năng" e="Function"></header>
      <items style="AutoComplete" controller="FreeFunction" reference="description%l" key="status = '1'&Operation.And;&FieldsFilter;" check="&Operation.And;&FieldsFilter;" information="id$freefunctions.description%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZS9TcZdv4MVV1zEH3weajDcnloRvzgosICsngJfzUuMF</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTPwsMynBDB15nLJ/YTB1D0vXZHvXwaWqoAp6Al/Q9w+7</encrypted>]]></clientScript>
    </field>
    <field name="description%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="controller" readOnly="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="id_type" dataFormatString="1, 2, 3, 9" clientDefault="1" defaultValue="1" align="right">
      <header v="Thông tin" e="Information"></header>
      <footer v="1 - Chi tiết, 2 - Thuế, 3 - Phí ngân hàng, 9 - Khác" e="1 - Detail, 2 - Tax, 3 - Charge, 9 - Other"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZS9TcZdv4MVV1zEH3weajDcnloRvzgosICsngJfzUuMF</encrypted>]]>&Controller;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WNq6rgbIwGGpnig6jLG4rA8bm+eGO0TZ3aW96kMAblv6</encrypted>]]></clientScript>
    </field>

    <field name="groupby_type" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="110101: [id].Label, [id], [description%l], [controller]"/>
      <item value="111001: [id_type].Label, [id_type], [id_type].Description, [groupby_type]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBqUYKfsf1C8RK71UZIdZEZOSveYqaX/ECSYhY6j0tASkKY0nhjCEH+UapqIyJqrs1qXf5IPcotH7IhItvqjX8gErv3EE1KVXhFuCPnXWgv+r/L59pWzVB6W4D5mJSqyH2xXdEemiHKWLsDIpE6Rj/39APtrZfb+HeW5HK0r6IHF4P2LqnsM81/GZcMMhLFfAK/wRXKFHNjb4mtnvhhdUpv/FfQcBQWr6uwLjAtleuZP4DCFoSFIPv7U8zBsuXdMst/LintD4ADLY3MBcrgjN6GOhPLpRpbZeloNpfCBErD+8Q==</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTIrM8IrQPIVG7ZaYz6p6J871QQkTGdwZqgmQhaLnZzWNzfH80oYX3+8TWIVujzGXew==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTIrM8IrQPIVG7ZaYz6p6J871QQkTGdwZqgmQhaLnZzWNzfH80oYX3+8TWIVujzGXew==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70A4fLbLV3kHxv6jagmvQXiQmVKU4qOaErPxnpphD6J+4</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTKXIibGwQSlQkqz8O246jhZTLBE2qr/wDoyEkmHVhMRNnXIg4jIYIf/9sZrJkv+xn1s9jcd2XZleKl/Nq2TASVZxrV85MKjQyKBJ5w562m99EokeynB/87CG6BABwl+hi/+An6Nr4nbGVW0GOEl0YeOq69CV63PvDrn2Rkpp20iMnycRxEfvXGHE3fBWVnb0dRybQ5hYu+PYOSUNTN2Oxxc=</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTPftIim2E80VlW1QknmBe7wOUvW1LWoI5ZDzrs/oh+leHCL0ym+zHD1I6MNtmvBMM/sM/DIipv+Veod2vAc1QT3Wv6Ma90nQjh9/XgJ+0Wt6Epn1zc2txh6DNb5xtXskhg==</encrypted>]]>&Controller;<![CDATA[<encrypted>%NmEUrF1m3jr6Ejr66cspTD3VJOgGYxn2VLWrKAH6f3wiHSRDsg78/BltREKt8jIJ+0pjpm2fsh6akej9yTbFmWa2LWwkAwTtUaM38mawaorNsuRR9yhL+aqlDB+tKC+f</encrypted>]]>&Controller;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WCeQcRnauBY0hPdLBdSXSIFLXyvVyaM+RcIJ2pB0czXsGKUTwJAqGkzC1D7PsPf1/piEgwQhoFsFQNdvoIoa5xQ3tUwDpwGe5YcezhPsWvlZmV/zcoazWsjTLssjXNJs+PIToZjf+rZ3bJgB9qOHDK/8RtkQlabMB2Tc3MofDtK1TZDbzNjxs5gyfTjiZhYkzvHMzkKIbAcjv6VWjmPAn2WJQu6RZS44IqnNazbxROtADGKViWjcqc1hhxBJL3gqgFgZrgF/4vpvxLZAYkg6QjLzdDk2L7OazdDf0IRq05+TTQ5d2DKvf5DbVD7GhksJs6l6Vw1ZwkxAsyKHub0zz4HnX4Q3msUmakLxF7lhCYroaSt6QkB7tYNEibtbDfpGfO721wSZRbfQbo9Od6fYM/ClVqO7iNsPSfbE6laXRJe+xN73LEBEvUOPBL8XMbXkQnsgcCC3xSX+FptBtNkViUWdH+lTe7rQlF4zVlg47rYyzhKTdX+vhNQ4LJldQD8Q7yeO4AcOIVxxXcGhg+No2jSPjjROXwf3Qwz19KvRz2Nq2jzg8KqA1nOenoSUE0jJ7+BT03sLyNQHO+PXXbRM6uH6wDDWIDEpAbOiumQVo5iVqYe2Q4CJi2741vy4vZv64Qj9g8m6yPwWO7u/3LOJkh5cM2kCnV6UD+zYc4taXWOc/XftfCI+BV9Iq1eP6fadE2GSpmSP1WgolEAk0mAO3FPs7bTKgaoXiWVjtYDYCt3X</encrypted>]]>&Controller;<![CDATA[<encrypted>%NFROcBGVVkMWfkof3Nt8WCYy4Swbi3wzxCgaGkM/EuRyMud0dMB99tj+mwKk0q3to4V/2OCcQ7+nwkreAjdjh3XDBDs38kOVrhrriN54ZOlavKi6mlOJlAyfxRY5568UUS2ZKfQdpoJvM1+Qza7FoHgDF3MX1T66TxxD7ztj2aIfkV8q00tcTrfm6bzGRZlcTaMxsQFgijHldem8ln3OcbNcf/CDNnKznhNPg4qd2DP6aWCXM9jSyQ1pyTSSwi0HZUnqzZ5SrFuO0WBsppbkMfAm7i88TPO0CwTWxcat26I=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Function">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4t5w2+icxkb4kqyHqVMqntp6wwPYXiI5+NsxlL24pwUJw+gFXD7AaFotahI6t0iY5J6eW+zqtKlXun67Qbha0hC27nDe0IhjbSvByV1fj+7YMsU2ZjpPjSpQRh4qoYL5ULAwxIs3cAveDOOhcKTcmBJjzCe9KGp6Jcclm0gb43uw==</encrypted>]]>
      </text>
    </action>
  </response>

</dir>