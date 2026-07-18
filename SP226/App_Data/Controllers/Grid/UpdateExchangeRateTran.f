<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Controller "UpdateExchangeRateTran">
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_access=1))">
]>

<grid table="dmtgdg" code="ky, nam, ma_dvcs, tk" filter="&FilterCheckAccessUnit;" order="ky, nam, ma_dvcs, tk" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật tỷ giá đánh giá" e="Revaluation Exchange Rate Input"></title>
  <subTitle v="Kỳ %s1 năm %s2." e="Period %s1 year %s2."></subTitle>

  <fields>
    <field name="ky" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="nam" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true" readOnly="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="ma_nt" width="80" readOnly="true" allowSorting="true" allowFilter="true" aliasName="a">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateViewFormat" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tỷ giá" e="Ex. Rate"></header>
    </field>
    <field name="tk" isPrimaryKey="true" width="100" allowFilter="true" allowSorting="true" readOnly="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="ghi_chu" width="300" allowFilter="true" allowSorting="true" readOnly="true">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ky"/>
      <field name="nam"/>
      <field name="ma_dvcs"/>
      <field name="ma_nt"/>
      <field name="ty_gia"/>
      <field name="tk"/>
      <field name="ghi_chu"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ibMbgBKX+0XSN0QTXpyMAdpCBOrXc7tBA0FETyg/t6ghjP1Y8g+UlhsLjlObvBuXORFG8odd5gVk3f9ed8QU8EuXulDdMuQikvhFbODep0pRCWIDAuUeMxJ3Og2zlXb2nzWkaS38DUmLbq1mcZ4M5Bw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHZCJUna/yFKe8Bti3dn9pkDX22TGEOR+f0302vpG23L</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygvUcYV8lxQzwF0wy2jFQYUUgFn1bN5RO5+IcHM27lZUH9wLh0fHVIYg06hdIUvYy6IbOOxmR2Nkg2VtsO3jYcPeR7NiLN8BrHJEly1iQ9Ad0Y0ijAvra4DJ3D5tRtv/zJ4sq6Sk1dgQTuM5KZNbgfnoajv+I9Cqe0nCd4PsCzvoq2JBRJDXnp3haVfcjYfR13nNnomW3CVQyM26bOQKMqYtIyEctvKPNGgMEyyLZ30XgvGgVQR+ss2WXHosQPwI+Ag==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL751wZiTGtWeHzFQZhMwU6K2dxZTKcK8IzZ4gALgNH9xBQ</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygr2kvsPoXSmgIyAEuNrnPj3rtGccRSteNqFeKWv9yAOHM6pLVN4Gu6H8KjyvI952cQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymyguUMJz/G6KkliQ4/jjeb/qRgRAr9qSkTmP5MtiwgSEcvRGHM4JsN+c5Yfpxuvr0mLw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygjvnWiA9fYz6fHjnsHqykzQ78yoru2YZiYgobNjgpOhoJT2zR+plBGbB0CiWNEaKq2UkaMPrZAx+50lS1rBNlzA=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygiaWG9v35XKXzfShQqRM5cZQSPNkY8zXL2COr3BwGvTxJ45FrG3VzhQvQwtysdQ8Hm/bih4oLCMncrziQV/a1XM=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygtHp9BxObKWSoF9gVdFv0jbfiso3ITYl0wEpqnWyDRP8R1xQ/jsuKWTHdv9LVhI3ul2THD5VSyVYR7GEGMKPRQw=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygiaWG9v35XKXzfShQqRM5cYxbjSeOwHaHiXIiMoAG6CbnR9rxpXEvfGVSI2qYCUbT2ukGhEiJIyPY5Cb6N5q/xqXb06GLidOj2+aihYgmH0R</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygjvnWiA9fYz6fHjnsHqykzQEL8H8eg5G94ZJh1xch+3LZtST0XRAzNdc4ia5hiAz4T0efjOxuFNb1BzXqZDBMPI=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygnDk8iXstG2RTIClAPxL0AgaHAnI8O5I3yexgOB0AmhRdu3nOcbILBnkB1LVnDKbwxlYhA3tlgUujRSB7rQLnH8Ev1zEtYjwHsOyaO6myqFAuqdmaBHT8K+x4+D+1SelJ7k7ZsckoGkXfPogwGUOC571aOHQVzbaLOVlrneSMPxBfVqADaspofennWBVLaHHS1auzt/B9uoIW2S45RGjjsE=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&DbQoHpVUVQk4ZohDQymygnDw4MJNsXnZ9R5lkjAfludAcuRHIB6O/Fyg5QeKkmMXeDD0XlUC36lrI0SNwjCfrqcR4zYiGkOssNWDZRKYOIdzDqPxLhpcRQwWYOs/Ub0rWaoSq7bYKfn73PSLrApHJSjRzdD8AVe37Wsgv7wQMArznM2AObLu179BuIqffHivdK/0TLZ3VfuVyDQo1i1mUhqdW38cR/vva5w3DPAQK/wFwoAcio8KErgeQ1YN/HdK/RE+o6XjUyHEMdy+PEiO8Dg4EREHJThXIzoLu4Zu+ZVoZdt+WVzN8NnIyM9L7hkUHJcBqgojMkaXIOztEC7q2hSgQG2THqtbQo2nW/3wrMc=</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ybbh9DvlB84/GmhxKNwapap/sTXcm0VJ/Myh3CE7TgBVYaUHJdIuHVHfFT9oJl+D2f7VVxObiqqO3/y0PcgiEo6IBaXl3XeBG8l6jx5iDHYkJrIfDzzYw8GOz3fi2qiUA2uWxVQMV11lpacOu+h1fbf2AB6aeulvn+yO3XCo1b5UVaF+4UqFpmvi9tI5wFxtXQNT1GFmQZONLsbe+uZNY=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="AutoGeneration">
      <title v="Tạo tỷ giá đánh giá tự động$$90" e="Generate Revaluation Exchange Rate$$120"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>