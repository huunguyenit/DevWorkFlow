<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY Tag "cast(0 as bit) as tag">

  
  <!ENTITY CommandCheckLockedDate "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu6vwF1B7d1GySFdWppW9fqZtKx1ZpaF1lhZoLW3rfhQUm9aYJxo1fETSn+odWmdSbzjRa/SjmykKy8hYizoX+07iQeFQG0MhE47jfFuCY9CKHDJGgveSqKXZbOd8fLI3VocBZYdcGE2V/YlnrqCqhfMgnE6CH4tRkl9YE0YeqCPDajftooKLZROpxa6YaTtFKWFBe/O1rT24ZBy3lR7maMkv8bF1mAChh3z3IOyvFqICS5spGD9TYhIjyz+iD7DFWZlWxhC3WRIRQgtJ4ea4nsunk3EH7xK3QqHi4V9kG8oYO/wgt+vMJTKUnC6C+qs2IDR38AGLOVb9Oankvmn++ih7E1ILgY/WHOan6xgyG1KxZxKgThXQ9sg4ksLlElJiQ02fl41JaYBiZ/xstAOzLVt2ySO7IwDRhWY+ZbyJGAwwtQtBDeVaudg/ILEjqnzY2ejTycur3L12r0Gn5KmIW2HYBLKeTkoL30+b0tteboSzsnaPzrQ26nzn7wJWk1rriq/okkBj/FspAT9GyhwMpFBUDAaYlaFlWJ4Z3nWPWIm9d8nTMKo6H5gIHV5L5DNB4ZK26PlXLEEXpx8uBSkBZ8hWjH7g06JUtl5PYi1iQYdQnjYFav4SP2nptg6sIQAuB8+sHJFTWMhEMcFMtIQLPW0Ad2dtgyD67+tCF1q/AH+EqUmxjZXc7RzRHpl06Zze6SmkAsghNRK7CVgYzWWr0Ah+V+irOre5stR2JQ++hkbHFastBusiness.Encryption.End">
  

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
  <!ENTITY Controller "'AdvancedCalculation'">

  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;
]>

<grid table="xdmtgt" code="stt_rec" order="ma_dvcs, buoc_tinh2" type="Voucher" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Tính giá thành tổng hợp" e="Advanced Calculation"></title>
  <subTitle v="Cập nhật thông tin tính giá thành: thêm, sửa, xóa..." e="Add, Edit, Delete Costing Calculation Parameters..."></subTitle>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" aliasName="a" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="&Tag;" type="Boolean" width="60" filterSource="Tag" external="true">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_dvcs" width="100" readOnly="true" allowFilter="&GridQueryAllowFilter;">
      <header v="Đơn vị" e="Unit"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="buoc_tinh" dataFormatString="#0" type="Decimal" width="60" readOnly="true" allowFilter="&GridQueryAllowFilter;">
      <header v="Bước" e="Step"></header>
      <items style="Numeric"></items>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="stored_name%l" width="300" readOnly="true" allowFilter="&GridQueryAllowFilter;">
      <header v="Chương trình" e="Execution"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tinh_trang%l" width="&XMLGridFieldWidthAdvancedCalculation;" hidden="&XMLGridFieldHiddenAdvancedCalculation;" readOnly="true">
      <header v="Trạng thái" e="Status"></header>
    </field>
    <field name="nguoi_tinh" width="150" readOnly="true">
      <header v="Người tính" e="User"></header>
    </field>
    <field name="ngay" type="DateTime" dataFormatString="dd/MM/yyyy HH:mm:ss" width="130" readOnly="true">
      <header v="Ngày tính" e="Date"></header>
    </field>
    <field name="buoc_tinh2" hidden="true" width="0" readOnly="true">
      <header v="Bước" e="Step"></header>
      <items style="Numeric"></items>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="&Tag;"/>
      <field name="ma_dvcs"/>
      <field name="buoc_tinh"/>
      <field name="stored_name%l"/>
      <field name="tinh_trang%l"/>
      <field name="nguoi_tinh"/>
      <field name="ngay"/>
      <field name="buoc_tinh2"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH6ow/THqIA09ad9ssn+J+X7QODzfMdkd3GPXxebiKIpbApZ8ywIO4gmpKcBa4QEXMqUBcC6hoy33ltIjY/zYlk=</Encrypted>]]>
      </text>
    </command>
    <command event ="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753W7sVkJn1qX8G5AYCGuxo27k7doDhOZ6XpLfnT0eqn9wQ+/VVs1oUSBRCadbvlPbYSzBcawku2T2vsU1Q3RHV8=</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL751GxiPO1Vla0sFLC/zEh7wPzf8kU9v2C9mvGVteI1o92DgORCjWAcqoVNzpaRoZB6rVqV2PqGEosR8jC2r1v+4/356JUld67z7sxzj5cEa2K</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5/S0sT6Z+8g9p2fCjPWM8OCY1d8NqsUZIEMAcxDQ6vag1D4OrTMYH9auH2fDEynxxmTOUEBIKh66hK7q5rdlLYkCcotspooa+HfxSH23H4gQ==</Encrypted>]]>&Tag;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egXiAN6R4ylSlOZ2swuWRNO7oRKVLN+zJ7wW/R6W9RsnIUsTfBS6dcADCHWEBCrx9mXmEKXH5vLbUg0kfu0hMLS1mzlKfNgvL45eTwxx5xIqIecDV0FchbaHt08t+ivJYIiracPkTlg0t37/8yhMCJHFKsSJr2+UKjQO0svoNAZyuMl/RL/+N02zN9zjTJc/8/2AgtpKfMoujFNERPfrIE1vlDq9MbeU1Uq7/ByOlsrGVfBt4vKXmRi0VQYvwPQn0eD8Z5GD2ffHCad/yGnmM9UxwZvwiRVefV8oGDC/QmRHVcaQKHpDqc6j7YXIUNqlWPEiIB784+9wqV9/zFAF4YM8Q6IE+uIA3aUf8kWgxBd7FiMadMlZ37ANo3xK+MXVWGy74g1/YAdE3RQ+p5ol6uQSwgUSNF0jURGaVmcTRXPaq9YoxRFydaRaIHExMyWKzyDM/g/nVvwskPh4lInDjtKsTJNlRLSy+vwCN56xKd7j0e0G8cdiRg4/K7Hc9Sr+cQpzwULpQEAFG2S9zd7VGj3NWqbKavxVLkK6BTk4ZuHrpSrFN84DXdPO2PWowtC/cxq9JgAUZfKTcxqmg8XWHemZVAHy+T7C3TwZzkSDv3BoZzCahmFPfUGLzGvhFf3HafbU3TcbkmpwiB6+yCTCriB9v8heBzWTcGTpHpmiu6eAE7dBb5thPrVpq1tFRBLl9B4rlHAiYYM4M2wRVMeVSzxLNikaXIGtPAVY4T1gKO6w9Catdgw1nzEn0tRF9nmVSNBmCq+k6DBknFNrUnjm8sPJIVI6FMO9YNmJ06qu8qI5z1joOLxE0cKDnkMhKKCiJPVSJzvf/L/xG3X/UCOAyHVvJgtSbAGbih67G3SM4Rh9kbPkNF3+EZm+1wlWk1QHiThkZdjvZr4ZO8q8vF1BtHVAapWnYHqV4shsKvxaKV59LqPVYDrCEgJ9hFMuzQ/0Cjujj2/rFcsBY7UQgz2LpM69XpimuK4DcKGuOJHTIBFylN+aJK+BSoQcVv6h2keUz/5t9io6RctWClDSwrPxvLUoz7ByHIMmbcigVlwDfDuKghlv9RwoLOjcuRxGdEwO1wh4Mc+lRfa9obNIzd5chPAcr2YpMO73p5JzB0mkL6ar48JwR8W8YZfhJrEd0X1RyB+8IrVm7d2S+rBWYvWawveLnwFxwZY0sjT6NUAOT3bWzKdU0zpmH6m6FMXvfilBUB1BQ70o/k8L6H6NaP58ISXWtFjnY+G6fCfJ5sYrReKznAwmed0Mlb8sFacdJxV/oGoSnkKIE4uUu1S2C561hkoR0szcuysagP/gZPhbPx5hOB41l+fgaJy0NZFiaIdC5n+5m1qSCZ1bUys2xpZKq62i/qgSRn99L7v7HF1eVdCbYdc9e5H6Dg1d117Wb+RcYwcr7OdfZFFsYbsj4WK1z3wfLi5ZOmL49DMRId7ymvDB9EZ5NpWQnnekif/9Li/aqPoLUnDph6cViZiinxQI0wMA5pV94r7Dpe0L8aYoAUnQI3TBuHaMzOe5j9FWrQ49BIom+9b2WhteE+q7CGISLJuEzRoqO1Aa5/F2I/KZo0xcwgISxc5rOpynNtg1QeYD4jFiFXxoxA6jV+lJLCOU3y0NTG2IiDsHDzAB4F63r4qcv</Encrypted>]]>
      &ScriptTag;
    </text>
  </script>

  <response>
    <action id ="Order">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA/vR4W7E8QKbPiDM8gRTXDGOy9j3HuzY2NUSukvZ9h0OgXRMZ3o/wxYwVY0yIZxHplLyBuHsLV+y+s7XVkWUrdeR6ong6TZoWfNnnne/nSmZV4I9pJv6TjlqSFGLykPXpbLwW8QTZ6kC8YUMth3dKGDyIV5AvEk8RppslvA6+u/</Encrypted>]]>
      </text>
    </action>

    <action id ="Calculate">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGZL+iGBYloA2ErdtGSZHIz7PagLw2npsOF70lugWa+87/uCSx+CSwb10Ec9OLRIX8uqHvJXdUvGBwNdBNgI98RsfzOp0FWFvei6SQxGMoxvL5cBi421cLfVw7oqMFqRxQYjThpJ40lDKUOKww+gZTLMqb2OA6FIHmU5wJpfzqH/MWtBsZF02Tw6wwMKK9AtbMTwgo5IFjx/Ix7BWRRAWKRkIBXlil6iO9ilFcKlpJDfUO/FTf8cPsA8YwFGcbnQLKWSojNEsbcY4gG6DmDjhk4B3QJFRIE43LVjBgsKX3TPH6ApL7RqQ6e30XFNdZDERSsnWqeMyKePNZwITMLPJc+guBD1dEnTHoDjtqoLPNHrwOI4TwD66XE2KoRBfSQh3bzowWL2/rP07WdIm0a8P5+rdNH3jYIuJbGei7s7Gjzs6QhIoaaT+KNBaXioSkfcBTDxgUbUBe4SQfmKLLaNQR2fwCTI/dPchx95PWXsKoS1SbM8W13tEIoHSnRU6rwG9GeotM2CB1BAHSYTPLMA7W90OQeUuZU7Yj7Wvi9vxXfC/EBI58JFqcPsS8Ev6DcFNa9jRA0nT9qtSNROaTq1H0zS8oRixMYWNnfeOYaqLYUcZmjfNRd8sLI/FJzNkf8HuSrX6MQOv6pEIN8pIxi3UGKsM6FF/Kla01Yum3m1DkfH4RQOTW/Mg7ESV06dPF1xIS0qX3fzzfgoC6SB0F3QJVOizV/D6BIRynzGHAJ7n7karPQnldmhE8au1BuIy2Izk8UG/ZKVxQP2J41mY8c/HPse3/+qUG7PAmbVdkbwrennFs/OIvNM1XsMpbpMPO1u3SyHkoSQR/F8bIXtBkMW86bp0EV/VxsGrsL9X/562BNWon3Cp8yM42XQBlzax/aYqbrBnlY8Hfy/s7IDPGh9ac7MAJjwKmeB0J/ehVFjGW/6eUAjF04yWflqBzqsLHVz21naMwpv/ex8JnzWwaC2IGI1RnGu2slr00hsatAHam/gi/JTbtodxrPZf9J4fwm0Y3Cewfun0uQQo+6ws7DJQI1qMioVUnuM+/NfIFsZissze+kgGA46FuY/fxFm+IYmGCxCuSgV8xbwE8cKrXshK+g9YdS0CexJy0hN8coVn8HM</Encrypted>]]>
      </text>
    </action>

    <action id="Register">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0wUjmoEqAqnRJtaHav8ddnvyduwl6zN1MkM+9vobd5S5hCGmwlgwHsIA6rSZPf5Uy9Z5pcurwJ/vvYdFtf3kpAEVH/j/k45ZObyp0l8D61XEgmmhetyKtB0ls/B25MUnEU/pV1/cDkdANAIbBlqLkACXlS4RNds8O/qd1BX0Y4qKHalue9jj2sCMu6y3S+nlnZLGHnqzIyMXhX5v9IQlP6NhdAgnVc0ENzzy18L35YwkvyXzYhlCDN4mk0EJ1fNXdNexH541L3OnCZuYtl7IDSZac/O0T6oafPwgDYpPutotdlFh/TXk+ZyLLGqCq5hlOtcL4ruH8iM7FtEThcP2QdqNiHfAbKGYElsAcBov2OYvGxn/zE8CmRDIaJ6IYwQJn77oJEcTko3TjVv9zDytQy0tEAmCwzprZ4X/zg0Xc8l3fidlyjPxnwkoGJWLK0eY4zVLUjpnVtymqj5/HFMM/k=</Encrypted>]]>
      </text>
    </action>

    <action id="Cancel">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0wUjmoEqAqnRJtaHav8ddnvyduwl6zN1MkM+9vobd5S5hCGmwlgwHsIA6rSZPf5Uy9Z5pcurwJ/vvYdFtf3kpAEVH/j/k45ZObyp0l8D61XEgmmhetyKtB0ls/B25MUnEU/pV1/cDkdANAIbBlqLkACXlS4RNds8O/qd1BX0Y4qJPQd+Z9x+sqjmZvigSVwpTh88QGO7tpMMS3A8rwHfYU/p2KfJceDfVwIY5yU91XgNNLA8iBkadS/MNdzVmTjmqeQ8nyiLrCLb/x9DDX5e3DF8+mhBQEYQMyJK1IRfvfkU/jvhMPxn8AsPPPw2O9iAUPBkGHl3zVehHNt13SPcrxnuhKkz2f0g4PkA1DI6djj</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event ="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1ZhmEptZ53jchjKJoNFF5cPoOvsOjbZtotiqmsCAGmU9/ev96gDPUwf5b9Ql+1SX73xxoF5D+PXbz6zX6c9FcQ3+Zs0C2idcieYM0gDgEtN5dF7JKQuFnT/aMikIBAOekBbsXlpwHmufo83FRhtXBhQHEHz3IWR9WZZzH5yzNjxvbDBBWOTsBchLvM0Uq8+Ql4XL5tWsQj8n9KgCUmMU4zGAsag9RhWh7dmApMx64C2t7R5EbqdjbRTyl852kiWDd5wQLcy4X9NJyl6todPtz/w+Wj727L+JKwfN50/Iqwb+wI7G44BdUO27jSBd2QOvezGJs1dO7sycJlu1AcJcpPUpbMWIy3yd8/MRgXSlVRGITwTMNh39FWbw3R/0Iv0XghhIvXLynvy3IMMw+HIO23IRcEpF+fnSc9V5MTHZ1oHWUTOhEZItvH2PLiFzbIKtWcINlF12vnvnvug68j15s587Bi5YGDz3u2rCYQP/DQuDV6fsP9QfQJRzAz7WwNUAC6wv7wei08bcbuNntWMrvI=</Encrypted>]]>&Tag;<![CDATA[<Encrypted>&uLc6/Bny5UrSIRuDTGst3aOlRg+IdWpMPvZqBpwyOnaptr7yht21U+pMOpulhJgi1L21wsH2t2XDkGZNIYt/VoWZbaZtBADHtzWUwMY697JZ9rOOp9h1pPqO/aZRT/p0Mxjmh8P/tw7fJbq1RsUdxsrf0uzMBwnBuGwke+Loxk9R70y5UuDi3cOltBm1rPI4VOMHWfxd7A/aXDtDu+/Oen0u+/ckg0LnAKVrE986gEi7qlBQAWzVQ9dR7mpXB9+B9nWOOlkTdgk+sup8uLlesF8zkshwpsLdn9PQH1iqe5DmY8VXcj8AcDGbTZ8HxZbRIFX+La3TeNUF2oKGLcjOu9YQeaI+pE0EyoyeTcd8oDW0vSN5ucsfwzcj9/p2gbTaTBI4y8G3mmuj3C8oXufEq3jv1OO65RU9EKP2RFGYZW7l3AqKqhV05P6T5U+GegE3b3D/hHcteenlEHt2dik0Nkw/9tYzi/6YbVMnza/l3vTcPVQ2HSN6mGi20OmlOiz2yCzj7WZCH7Xez47ODV+cmj7ZkSdzu0ySyhnfoBBnC33kvtgYWpuptXwMYBL8t2nX</Encrypted>]]>&FilterInitialize;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTnYu2hWUirTXB+S9/XpMEt8ZXWtppKP+w5FakEpBW4DAy9P68H7EjG9M8jNyRGb/CY2gOZ0fyAuvwGNg8WzJKXR3WJyDvndYCNkTu2xJUYI5YGbJkjXRlzqWpZfzvbI4HsqDmvhnopJw8sAzo0oPEFN1QIg5CqUZFUccCQbzZmuZ/pL56fUC70ePL66MNwe3K5CvTvKKiy1/q6tfaa38QuJAep2aJTqOQZBUNa0oUlKoF5H5Y1ATB2iv/9RH7QzNEQz7JdqxEdLc9ssq2Oyt2J</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5/hs1JwWZavpHG8QgarjgNn4C0ZMLH+aEsSGKq4tuf5FuHeOMViIz8tz3CokJrzRdXb7dc/pat3cipr+q/jLRjC+v7stHVrJvjX1Pn6h6crBfZ87bhCD5WFrVarbWxrVTlfnRl18aSDNPLDWfRv32sfwaCQnedDvcpw2yZ+VVGa84UwELBUKbPYK6+cDRVjIYXh9ZVVj8hlwqOqIP9U0oRUziWQ36rhOw9tjulpY855CFtCTA2RcN6z1TcVbsXZJxqvbXnSqSTA3H5kCJBXsZomUxLxbBrkOxx0yuAlOMHV</Encrypted>]]>
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

    <button command="Calculate">
      <title v="Tính$" e="Calculate$$75"></title>
    </button>

    &XMLGridToolbarAdvancedCalculation;

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>