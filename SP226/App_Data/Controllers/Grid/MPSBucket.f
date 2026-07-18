<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Identity "MPSBucket">
  <!ENTITY MaxColumn "24">
]>

<grid table="mpsstruct" code="ma_so" type="Detail" xmlns="urn:schemas-fast-com:data-grid">

  <fields>
    <field name="ma_so" width="0" hidden ="true">
      <header v="" e=""></header>
    </field>
    <field name="chi_tieu" width="300">
      <header v="Chỉ tiêu" e="Norm"></header>
    </field>
    <field name="ky0" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="Quá hạn" e="Past Due"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky1" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky2" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky3" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky4" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky5" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky6" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ky7" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky8" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky9" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky10" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky11" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky12" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ky13" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky14" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky15" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky16" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky17" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky18" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ky19" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky20" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky21" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky22" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky23" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ky24" type="Decimal" dataFormatString="@quantityViewFormat" readOnly="true" clientDefault="0" width="80">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_so"/>
      <field name="chi_tieu"/>
      <field name="ky0"/>
      <field name="ky1"/>
      <field name="ky2"/>
      <field name="ky3"/>
      <field name="ky4"/>
      <field name="ky5"/>
      <field name="ky6"/>

      <field name="ky7"/>
      <field name="ky8"/>
      <field name="ky9"/>
      <field name="ky10"/>
      <field name="ky11"/>
      <field name="ky12"/>

      <field name="ky13"/>
      <field name="ky14"/>
      <field name="ky15"/>
      <field name="ky16"/>
      <field name="ky17"/>
      <field name="ky18"/>

      <field name="ky19"/>
      <field name="ky20"/>
      <field name="ky21"/>
      <field name="ky22"/>
      <field name="ky23"/>
      <field name="ky24"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XM4h4WitZuR0Hgkjld7iv5JZmccXWU43Ii2DyI0BaqrJdmH00sP4bg2tCUXixqd6FZvif9PYQxXhiC1khOLxe4ILdxO49zlmVTx2dQiHtPqvwjOUNHMzHO9NhvSIvNdW1o+cNuer9K0yNKJ5cOgy+BRGMKPC851v89aCB+3HANPblvYSCRjgmwvWyaF3MXdnOZyBKLol87ooKzrsxJ2LrvQDzIvXlX7gO111lKbvGIAvrokot1+W28htLrrI8tLcxg0KFN6IB6+wfCAJT1AFAFX2oYCFLp5zsF127QH0oa94/q5N9VmFVIagVXgdaR4yuB9XwMqb4CuSsx8sH3MR1oQQ576KePu2uDDl0TI+op2e38py1E0o/wloQ5I7/hVEb2AXbSS2bI8oQu2daLH/d4h9hBP8GUOgMnCW9VmHsEVfj+icAGFJ0dYhn6FDjeqvg==</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERs0p6dcnuPXrUK0px7eCfKbiSjkFcI/ngXr3ppv1QXEi2tpnJO5inih2V+LNg0rYvg==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4PuVsx8HPOHN9j1LElx/HzBMF52oDifsO9zk9U9uLH3</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERs0p6dcnuPXrUK0px7eCfKawjuGyDK4/Fa1yGUZl4UVEWfwId6lMXYwFbJ1iU7rzOQ==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiGQk52uEXAXijFQKsAZbIETuVAZWvKKWUfIP0Z+HuVky</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERs0p6dcnuPXrUK0px7eCfKawjuGyDK4/Fa1yGUZl4UVEWfwId6lMXYwFbJ1iU7rzOQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NWgzCc7+/3lgNH8KZtdEsHBSlxRCcmI+tHCJcDSni4l</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERjPjcATIuJI7Y8xPDh4OYG1j8S1ESGf5q1K6Pco48OCUBmNruLqdJ/rqGwhShqSG+A==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfNpJu4KCNAGDdtn/DZA4e1yNV/Ypo2HeLNY9q1XRfV5yjfWlQ/hr2efLHPshA19AiA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERi70xupTbeEgbFqed0qafTpUlDDhUWeXAYSjH2Y96MpwSXIhpg3zMXZekjHm5zX4TQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfDglcvyPZt23JgYOuWcm56c9G9nQrD9Mr63vZncmHmeX/MSS9wMHtKMHMe14Q4zLXlUAOFecixsovtLvxoiZvnY=</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERmRucLgPhQS8ra1/bUJrmG7sADZAz6ii/1qVkPjpSMWBiFHjmc8tLADgoCSdhTocix8oUCQ8HLycf/irQDcvmQI=</encrypted>]]>&MaxColumn;<![CDATA[<encrypted>%5lFqmUUsBRZpkfzpmkgEFTNK5+0sG1EKsKTBbxK1L1KqQs544HZuAVhcFMwIOVfjMbzTNIpPBt1t/f7AtQsE72bCoEu8/uzKBupPmCgS+n8fRZi90ll2r61c7pMEKR5ItHrBVEEHBl0ZwBW+42wfXw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%p9YnHnRKIztWkVMZVqfGx8QWfK9o+b5xEF0gZ8qvoNE0qcQganuZjf/8NhgcSqZgWrbk65oiYmv4wTW5f97JJTwh0IapyCm7v2f54rp2iHY=</encrypted>]]>&Identity;<![CDATA[<encrypted>%p9YnHnRKIztWkVMZVqfGxwzO4+KC7qURwGL2Kmd9wc73YQtr4Ewm8d7g+fN7QHzyZJRJMrZHV8ChKR+TEDiqqo/CcVUQv+LJkCjaeXPWF7OHkn3O2W7IPAx/2apBDo573y9wRxdQ6r52vHc4RvpBxlqJqMqZwzTWX584KfewhoyGNRt+Y7Qi6w+CcaGOJ3tmpD8q8LcT/lM3OohQGg9S6PAGfdahAXFcQuo3+s+VkRD7aAH+Dlloe6ORhqcZTBlOhAm6mmd6bL0296sbCADb6cs1+RKTzszPTUDulkQm57xF8nCD80sqW9MPkM/lWcfGGPCg1gicFrIYlEgn31v2vAhpRFWWZFnhHv5AS2xkf+vqfOgiVz2uYeCfczeH+Rsj8brJoHpPHGYdxMVJphAaGA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%p9YnHnRKIztWkVMZVqfGxzO9I4z+RxXvac2H5zkrON7WVEbQ56HBeINA3OmELtnrgKcEYZXeRfpgSFyTVCeJXwVbFypzRdCv5i9o+Bu7jJgQ8AX2EOS6GooRkYY2Mr5mQPk7M0zNx/z1V4Q5e3cHN8On59pJXw6Hq+X+A1UWttVLM6ufbRYfzqhYAClEZP2Pk8mIOBKMJ+JkLpF9LTxlzjTqx0pppn5diNLsvhVx8Cg=</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfAQ6CXCS+zp8OtauzTFOguSXgiJND4u1sSgblRVHdfGi+j8DfjaTzLd9NO4GEOCTTxaarCreUSYpFSu0XzhQQjT1rn2j/rhAAHumd87vj63LOIEU9YgqP8gz816rnUgQFDT8s1W8zLsOV9kr3OlJuwVGeuDzw5xGHImNlWD2xpZskYJ97wC26SdK2TG6HPaplnt+b8jhDcqpc8iFuEKspvA=</encrypted>]]>&Identity;<![CDATA[<encrypted>%gN+CQqYYzOUxePjsxbMJtyenhFl74Y312QHcasxHB6nAM0jS15A4+IAS3bQPFqsfm0gApPMwXbuSE34unjprSw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%gN+CQqYYzOUxePjsxbMJt/vyBR80RChfJ438Xnk1RUTM14YheEvOjZesqs4euMM0UWcdfOqm0MDEuJADlGKuCS5WzzKEty6bgdVarcXxXA3sWtoIyuelacKszDEaciWDdLx9bLrhj8BEkFXD1uDgCqLLXlhBMg2MI+PW+pZSRXRGLI/7a9+ry7rpoG1kam3V/YretQVaqcLO4fJHs7Gxxg==</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiExLtVkBVPa3+PH+l+AcUSHBs0qFi3mw+YR+iGILS4nvOP+Ajbue20N9PoB0Z1CoMw==</encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ZJJ6uLqUEg9/8nnu/Am9v43oPRJBd/RkNr2CrA8ph3s2jnC/Sh5NOvO7JN29gtD0CZMo3DlCLcJZg8jDg3r4Wy9TW0ec3XZA6sg8Hxg22w4YLPDCCem0FJugO9XeAF8I4ve+68iCmK8fE3T/1NosuDk/E7LCClaGHFoSmVWN1Gajc69Lzu/iJYNUCIvTI3MC0ahjgkEIJom8eiC72kMR9o=</encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>