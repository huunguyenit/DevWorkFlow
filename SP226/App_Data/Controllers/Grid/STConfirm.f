<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Xác nhận giao hàng" e="Delivery Confirmation"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2..." e="Date from %d1 to %d2..."></subTitle>

  <fields>
    <field name="giao_yn" type="Boolean" width="60" aliasName="cast(0 as bit)" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_giao" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Ngày giao" e="Due Date"/>
    </field>
    <field name="so_pg" dataFormatString="@upperCaseFormat" width ="100" readOnly="true" align="right" allowSorting="true" allowFilter="true">
      <header v="Số phiếu" e="Order Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width ="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Ngày chứng từ" e="Voucher Date"/>
    </field>
    <field name="so_ct" width="100" allowSorting="true" readOnly="true" allowFilter="true" align="right">
      <header v="Số chứng từ" e="Voucher Number"></header>
    </field>
    <field name="ma_kh" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh%l" width="300" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="ma_vt" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt%l" width="300" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="dvt" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="so_luong" type="Decimal" width="100" readOnly="true" dataFormatString="@quantityViewFormat" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Số lượng" e="Quantity"></header>
    </field>
    <field name="ma_vc" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Phương tiện" e="Transport"></header>
    </field>
    <field name="bien_so" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Số xe" e="License Number"></header>
    </field>

    <field name="stt_rec" readOnly="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" readOnly="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="giao_yn"/>
      <field name="ngay_giao"/>
      <field name="so_pg"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="so_luong"/>
      <field name="ma_vc"/>
      <field name="bien_so"/>
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75/LoBZviloreISoXiuNrsxnQxz1nixKWWZTMuX0kWwFNf3r7XNPX9TByWwLXAuvs0A==</Encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753W7sVkJn1qX8G5AYCGuxo27k7doDhOZ6XpLfnT0eqn9wQ+/VVs1oUSBRCadbvlPbYSzBcawku2T2vsU1Q3RHV8=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753ZOxbIC+LxbnrSHSw7x7wObkPS2H/Bx4sZhA2uYq2nGvDFzd4RWXLmwgc3k4lAkrqBSb8y/ZKu8bw12Es+n/4c=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGsG8HAAYp9TCFPr+4cvAtgfV3lWCPDU4Xv5SdTcja3hun+xuBWmc1iN7SKHuzX77zYNt4i9o7grQZvGrrq1AjqrY1nW+uM2OIFzq9TEoBckQ6qaUkliXMp4PiuEG/lVMtIi+GQGud74KtUl5at4ZsbFefeZzLhDAS2ZFXNM3eNqnp4wi3kVY2b/DJV2deSRNeUWCR22R93g309NMAWwkiaeQl2VSBg2tq0G5foscKkHEg3NjqPq2oxEX3GTWWhwit+v7AxoN9F5ET4ct0SmFGUGJQoHRXrdC1Lsehh1WVPOh1TJkv/SfkjnLwXTVQBzsSJ0GheIyzFhlK2rzcStfZqQw2E+jCXbPXNezBdDbsgeU8QRMWZZam4yctfKyTASxvvfUK5wENnCO9zIM24zM3OeMSHR59/5zlFkuYpm5CedDDSj1Se0VTRDhShvKWmZSJj26WA7aqH+QfL5K81kVUQRcSxfPbVXoTUsIdMHFowFcJK4ciGvnd1GX9tr2oiIQ/opXMRM0GYRXEKX5QxNt2qbc0NtL/k1qAdAXocBx0VdVNKjLnF9jVmKxqHQjJsO8UZmTb/GC4e6dnW0uZI0lVLJwi2p94n2/9lF7WAkQ3KjHK48SYlV4IacwsY40UpuCAFnYXdiWXUCZTvkXRn+JOYtMNsZ129ufm4Yff42Oy/GAs0XkIM9smMv27LKzyYxXRvZq5On7kPtne1aa6C3j/Y1o5DgGdHUHPXtl5SsNy+dBw==</Encrypted>]]>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Rzn8wNr3GxQOa/T7GRz/wBqBdzybGVO1WOPY9cZMw+p/KQYsQPneHr91new8vK7GwzaRMqO+66tH0jItG2yJlqZ2yWV2WRB7/vhpY4wjo1Z96lrSJ3vQKHcZGiYM3UMjuFKbf4we2TwZIHuO5H577LhZQdFEkR3EFPagSwLu7KtmYWZ7PSY1P9+CcDnBQ599zY+TPw1/Vz0DLUUaosDLpScXWCe++B2Exy5+yMY6RK+Md7KS6EfAveBP2rptgdyvq+qiOkZLx84owWIrlUFt4KhbWsiZ0hUJkMLNAoakf9SG3o9qP2GYWtdoiE37hHBG5V8KyNbfNaO5T2PUug1BUGNDrEgCiFCAOXVR7a37xFo6su3ox1EHYJ4eKPVPGFKW7HFNz2iUULoVWOYyZEe7gYqSqOxYRo0Ext+w3Cgi8a9iLI6Z1DBkWv4b+MMOg7bOLIe2jK7ABJDqDISljA9dz1EaXsiAeTig185390eC/h37ICPnEnkPq/NqsfWijQfeg65/2t6brpZBD9HM4Ymfae+ivj0BEZMM0CJ2iaOVw7ppCQ/qrqwfms7tazU23Vsdt30GYLIoP3Ive0ShFFGyYadlyNzffo9cX+84Hpy4rw1OevcIkiv2b4cyqPqBeBJjK2lN4Napkyn6Drwq+wbMTbitVxQu7I3W9gpP32CRlIvGLY1hK40omPwOfaxOwoj72UPpcMNmhLI3RcwopNF8qcnBHis3XO3XNQ3UslXKVk+RRQRQsEGk6j7FHJITYXXAh5gFFPoxM67ZXM1FK9AhYvwhNwMCV04nfWd5eSaWex2wrNOknv3yXvdQUSoMoHnks069AwLCR1tCGtiVWt4nUZDsWIn760nNLx9n5gggmSX05Y2OD5SQPuqDgbEfV0OKJs5OW+hVUk7J09l6vuCfUw=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Confirm">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy83kk4airzT8cLd6DkoBHuJaQexr/D1WcjxYZDjdTQPhQznbzSQ91uXMwY4Z/4GO8kHoHooX9PkaeO2fT9vhjmbRZX2fSuPnqt305m4yVoJ4ZDE9+gWvTGwD9mH2SiIJE73aXUWeD7YRb78nnCj9YvRvUWT5fyHcZx1avb46/C3J0TzSy0N/o08cifG0i3JYoMYX3fWc+FoWmQbdKk3Si55CUQhkdPyR+oCqvvkyX1YmyAELzlREuGCUy8cj6cftmb770XSklJltmnAgXTGQ1OBZHFckuJYLC/80+AnFeBHVLvlQohX1zrfKzzbgnUfKpM/5zRSDnZMMRObn8k3hnXV0o8YW0I840mFKzBjqg7xBlzQY8Ch6s+hB9OgZ3uM9WxXk/s74Q+mmwxlaTkbsgEl0trkTDMJKJjlpujxoNrjRy1k61B2bcKVduuvBYZM7IVw6Slo2ZzFHgCSII6quxDFY54hWY76zsEsa2cOgX0Yf6Uv4XHsRbdh7MikKEIaak7Ri91TTFtyxkRK6GgTK7T/z8UFx3MlxprBoxs1KlyPvdIQ6YhlziiGKHtSZirQSeRiycZG0C04e52DqD4ajtTFzS3AFQHw25+fAGxILzprDfYfwNR1iH/LMcbGmBM3FNqKjzOtcz3YX2TuvLlgaAM=</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/izKywB7gs8GyzrPtyjqgTnvRRCZTGKWWWsF0He54t971NSg4io0Fyo4giWOYglKvwVp5qvCF0VRdkM6f3WZVER+/3j6M+7es2LhjUsBcTECYJri1ekovExVhcXPuOPhm9Zx++JdI/25zv8Iw1GqR2NDcspS1+Xqphm5cIJfkxkWGYA+2LqQYO3fnhQjzuUtagQMs6IbqiKLDnPeny+O7k=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Confirm">
      <title v="Xác nhận$$75" e="Confirm$$75"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>

</grid>