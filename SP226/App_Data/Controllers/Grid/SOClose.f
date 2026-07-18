<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY XMLStandardVoucherToolbar SYSTEM "..\Include\XML\StandardVoucherToolbar.xml">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="m64$000000" code="stt_rec" order="ngay_ct, so_ct" type="Voucher" id="DXA" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Đóng đơn hàng" e="Sales Order Close"></title>
  <subTitle v="Cập nhật đơn hàng: đóng, bỏ đóng..." e="Close, Cancel Sales Order..."></subTitle>
  <partition table="c64$000000" prime="m64$" inquiry="i64$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="&Tag;" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_gd" width="100" readOnly="true" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã giao dịch" e="Transaction"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct" width="0" hidden="true" readOnly="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" width="0" hidden="true" readOnly="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày" e="Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="100" align="right" readOnly="true" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}" allowFilter="&GridVoucherAllowFilter;">
      <header v="Số" e="Number"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_kh" width="100" aliasName="a" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã khách" e="Customer ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_kh%l" width="300" external="true" aliasName="b" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tên khách" e="Customer Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" clientDefault="0" readOnly="true" allowFilter="&GridVoucherAllowFilter;" aliasName="a" aggregate="Sum">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" readOnly="true" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã nt" e="Currency Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="status" width="100" readOnly="true" aliasName="a" allowFilter="&GridVoucherAllowFilter;">
      <header v="Trạng thái" e="Status"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="&Tag;"/>
      <field name="ma_gd"/>
      <field name="ma_ct"/>
      <field name="loai_ct"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="ma_kh"/>
      <field name="ten_kh%l"/>
      <field name="t_tien_nt2"/>
      <field name="ma_nt"/>
      <field name="status"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGsG8HAAYp9TCFPr+4cvAtgf9lFENc95FGxH4cNVebk/MsnvWfKSKH/igBEfQoCU6oGH9q04imUEQXHYheFIhwi6Rc285EDg2z37b/D9UDlT6S2jEW18ihnWf3WGbBonq2g=</Encrypted>]]>&Tag;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egcX1kpT/6OsU9X9CKyYGs5W8FG/tU1cEnCatgKHLE0T7fgIeiHW7cceXoTIn3/CsgGVODht1syTpob+XUL4Abhbny2cZ3hKf4owBQI7F+7Iphz9zEsckNsmbq/aCp8k0J9vhdLRFYNEUUS4EwoDm+iNvYdyUYkga0LOeVrlq5AW5mrRcrz3ewlrIY8Amqub5qQI9dGGQKQf67O3KCWGFxmQnTdde3tBftcxVeGsC867VxlojvJeZgw60X7o37BUF/77x5OWq3NsIe8cX/VAOPvPPwzFWhprBmn1dGgNQjnHQZuHlC/Uvm+Pj/smG+xqUpEkDzan62NeOVII5g6FUAehfddI4FAzxVUAwwmFup446tVFx10lDOaiuOefYaZNR0T4mDIihRrYoxxrZOWvAREve3JGnXg7ZKiKBk1ENK1/3yC9ClTYu5kEDF3/S2uWWpaU0k8wrCEiZeAID+IMe4RwBcgD0Xz+N5N/i1iXwW60GNXxdG48jGDjt0pQi6olxkICIF9VallpFx1DzS9y0tFXKX34u35JMSN0vW1uPLYwVkRUGgRM07mqcD5oGnn+B9l+fwlIF9l2hzy/ZP72ApvFgUvcc42lU5QH1mdT7j0NlvBjw02pBXnFmIrrHfPAIKR07VQKPAvmLacvYHGh+S2DhQpxUYvIgJmbcwuPEM/ox388OqKoe8mNotPWQXdXIB0VR6AU6vkhZ7G19N0lHVbG6RsqCqy4yo8v1wGv5Q0CZMZzt45n0JgTczzngqYR4niIfIBqFwV58KfAx8crfkiismMq7z/9Y6bzkD2pkD1SlMbTg2O22ZucX/hpm+HlY233reyFkuMvzVLyHdZ235Cfv8taOTtiHE15HvJsokPcBlPaJyFWpDUkjCX35SHkmGJv3Bv8intJiPqoV6NNzjVjxIFeOsAnjfQUZWqXk98/4GUcfILYu6l97XqZduzAqZ2WjaAuxO93ZXVt8O+9604s=</Encrypted>]]>
      &ScriptTag;
    </text>
  </script>

  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVTRbbW3G47hr2UL+B7ULcAqbdE0VpLI/lpK01kvP7GRGxkDatAeO4oVLuLDDs1RSDo46j7V1vpCTIZEe/Na7B+vNyDaQ2wgEIdcQdlW7Fnbz+SlfQFHi/qP4kwLxqDnJIrIEuOmSbmiomvj63vhBgT5n4EIlYSz0fseu8jaWiEDw8nCNANQvSCJEMfvibfwVTXxAeaOQjABaOJIyuL7o14Hig+HHQK71hBG2nuzvQRXygTbRzjpWEOk6Fq48eZikrJQHI+FpIlJKqJ+Hde2z6NkPILTDDwJy1fWXX8U4K43Jg==</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuy83kk4airzT8cLd6DkoBHuK7wBjQPjBdRRTJyzh48zTazdBPMkNufDJTzVfJEWpa5JRpbtX/I5PXFs5q4GgN3RHFvCeBwgflCcKAgKyhaLUDZlyoPtvRsCtOJQORW7W/92mBPYftccZGc5QVpuTOPE3ur1XLWeZUzO08bLEJvJmNyH8T5wzYW/Spug1KxIEuU4Ld+vd4YuFoQFx8zED5pd10zTkk5lbIGUCsFyoF7MS3+0+2c+KhLUl5IJ95aOpXz3uJaoqAu0BFEj2FHyZcS8OF0M5wEAtJqxM7+mSd3zVwAL6V/MOKzMwHNqQNod3Xw/+dixnowXKDV8ertUfJij+YNlKjDs64i2pPywlX6n7pgOhojxIlsrXmv6qJvx5AaBOCAy0XSi7ohSGLyfANGFgRd8zNceVcp4o6975uHQTe6edvO4zJnamSXx8mNK77YErsxWYIPFZnNPfeCmu2CUWyfuluH/tjiafWp8swBYJCVXyRlksQOvUOitb/W6Ybv78AFOEFGOCZQ09bEqz04oegXbPznHueRz7rGCQUzR1Ri67H8k6q9HekfhDUIOtF7/0Daga5AJfNt9C189i/bTD2eK0C75Bm5PmAedaMvTs4S5vQ9wWBqj7LZamvTjzpqZCSDNCXdV09a7azYwGpI0FwByGm5+cH5eMRFkOP+viH0uf/uaX0Mz9REH5yu4SAQy/Zv7ec8hxugVY/+isHWEf3hbYuxz1h8OHmwyYuZe0RHzEW1QhX+9Tv0WOUfTFM86OjobYUczxILt/Ojma/OKpZqD9YlUFlXtIt/8Yk237n08uf52OX1ScDGRTFZrQ/VyAmWXF4ooXC29/olAp2wr0BDVJu9kE7qLN+JG/8/JWjUZOZqQ+3OBOdBBbj+i8QiStqLzERXCTbJB80dnQsCk=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="Close">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyRdN+kfvkY1IgtqEhmCoOhSdJ5Nkmgu1rlGWpmZ/1Vnesap7r76h447zXleBB1HmSYetitblB1cQunGx/+xk41gfu50kyeiiIGhpEWSzbGMuBKhQPBYx+AZxLFaCp1TG30tKWOVFytVNjDCMQMjAecqv54FOXFGTO9eQl/Ajw784FWm9FN1b0KZpc/ck8xLJN2p9AazK9HYYhPj9JEI9Hj4YK6xbPUPN+hp66TSaVAw/Kuf0nmHiCYuHBZJkdOv0UfRlM7lnGbAngzaK3nUz7kfYLf4Y/cqgA1oIbnGjfX1VFqDkcGCXCnolnRyiF9bvST66xptAW7Znvm7aBLUvZ0=</Encrypted>]]>
      </text>
    </action>

    <action id="Cancel">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyRdN+kfvkY1IgtqEhmCoOhSdJ5Nkmgu1rlGWpmZ/1Vnesap7r76h447zXleBB1HmSYetitblB1cQunGx/+xk41gfu50kyeiiIGhpEWSzbGMuBKhQPBYx+AZxLFaCp1TG30tKWOVFytVNjDCMQMjAecqv54FOXFGTO9eQl/Ajw784FWm9FN1b0KZpc/ck8xLJN2p9AazK9HYYhPj9JEI9Hh6yCNhPuCiLIb1hW7TW65+ewz7l3fv+lQm/BQnpEhmM/cpjgMCwgrQZjBrUkV183zgsLK1xF0UubmkElwK/GCXH6NHHPleMwjnpokoy3o8hCpBYhFJXu/aAQMaFxAug9Q=</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6SycXjKTM6ycMLJVwbRiKBeDiB7+d5+EXZCGDYuvG8PGnzqXlo8mzQAMq+Cr0wgMPJh7uiXOWRK4KKkZ4j8P4PeBYZCwAheDAlbp5qpvIMCsoQbkw9pclkVT/marGHI8j4CJ+6XHYquIZKu6B5NXkJm/PflxrRByJl4KMOb90OaNEZaWlc4lyqpxGtKAQ1Xg8144TmO0DADDSk+FtKPkdEL2GhvDk13WCLXY3OvW0biXdrbW0d+fcUUKwbJmu7T2g==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Close">
      <title v="Đóng$" e="Close$"></title>
    </button>
    <button command="Cancel">
      <title v="Bỏ đóng$$75" e="Cancel$"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>