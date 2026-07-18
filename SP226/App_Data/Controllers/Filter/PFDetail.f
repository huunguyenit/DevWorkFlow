<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY ext "73">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'PFDetail', 'Filter', 'PFTran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="m73$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn phiếu nhập" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Phiếu nhập từ ngày" e="Date From"></header>
      <footer v="Ngày nhập từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Phiếu nhập đến ngày" e="Date to"></header>
    </field>
    <field name="loai" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Hóa đơn trong nước, 2 - Nhập khẩu, 3 - Khác" e="1 - Domestic Invoice, 2 - Import, 3 - Other"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" filterSource="master" allowNulls="false" operation="10">
      <header v="Mã nhà cung cấp" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="false">
      <header v="Số phiếu nhập" e="Receipt Number"></header>
      <items style="AutoComplete" controller="PFInvoiceLookup" reference="stt_rec_ct"/>
    </field>
    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="11100: [loai].Label, [loai], [loai].Description"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11011: [so_ct].Label, [so_ct], [stt_rec_ct], [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHqUfQLRDdVCOOtFCSOQHYLiR1W4rRTq4BJ5gWbyr/XduOkWXh+rTVQBAuEgtvkodGiJRo2SJc+rprXnDO+kD5FQOk/5wOOr93JyHFUi9gwy</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJAQiSUxgxlzgtKgXPpwTVWruaajWobvnNUmkJgthkeGjWTWgpU7PBSP86DE6/ScrJ0GlEFkKbY/QRWF4WmiFAA2mqqHJDJXie5lk/sCteAO</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJf5FXoFE14N4KL0sQQh4UgnQVNCwmiyt5NGeygpiIXAz8ux4BYC2+aYFo+prs6F7+beykHIKix6Oo7vGhfLXvMjGRoVlPJ7jxaCkzj4Sl4R</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VeBXrvz8mne6Qr8RsKX5kG3/IMkjtWOWOS8a35cVXYmlJVhW9laTKK9REZ/JCTg1hC3WrgN6BfA4rNgt5oySXMM28PijwJCjSZ5lkkMZnv8OkE0PNzpFFHmM2z2840jEX7hT7feReVPG4QPtevG+S6YCeeajqE6BB4EB8U9bYGCP7Gy72VUr4Mg5VNFuZMaaSZHbWA+3JRY9xzs5cz2+A5z0Rxs4oQWFwBuS1OOlXfoV79Gs2zYZ1+Rc+7cue6RSA+dJMy33FDB/Zde3gOMDgmHZ0zncpsQq11idrYVfK5/IXfcOm/TdB3KmspCqyieN7yg95Pz6Z9dMUt0MldgeT7DeVhxSDlGyUWAOKUKN/Nx3nXRSljDfWkHBwT5t/aOniK0ipyNJ8ZPYX6hLRhv7ZJ/7VnWVZuTStCtSrVVVxn+A5Hz8/mkc5GAe1yP/i+4prdO3GBAQRfqu2sTf+EzpH7kPlS1eE+Y9+hx8mXwwRT</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOp/2Puf32gAxAVYwtlq800vpUlpqReo5P6KtIWis6PXBUI+zp6RRjAQEZSM4oTatP3vOa/SC4Krkr3OBaMv6yKdqSIkSM9kDqlvMT160vJyGC9Hc7AGb88T6VbcsNGDHQq7eJqr4Bx+MrpjG9JbdwdP2Idz1jD/jYQhJpqYQ2qdhmZqtXdPPoYYT9PlW36sjISeCq+mCzi1EmXGOlUtlWjHW7VDhIrwprACU7grFMZ6Lacrt7AyOKTGQ5Yk9h3eZJr2vv3KBpaVeoc308zU6/IcQ0RkXyyDpc7Zc7NxdQYC/5QSx+2Q9c44FMsgoc7oYk21Zs7OQWa83dC+KH2LI07VnYAOtW7LhblA2vsS/CaRVVyQ/mCZnMAhMSFr/YxgqWxQ7Lu+xf9L/nJAu+TWMDS+eyBfGVEyyoUatBdSxS/wifxDIpS/jPKPZwhEk/STVTuBRBocJxNldA46KNpHn9sQ6667FM//DEudZEzxbM6uj+AXfYwdHXfdXVroWmkXHzHZceMlc2kT1Hg5DM3WRnB1f5wrnJZY0Xc5IziEATcN8O7bLGdKpMMHKyEc/XExk+TOHXRb4cY2Lve9QHgFB5W5K5vNnNU1GIXvlZ/a8l6SxAdPyZmFK/4pDElLAkCUAqdMIHhlXiYQGHWddhipwqvP36W/4XtIef5Y1ehdDJuGZyCTHMY0PE11ip1lncamEJKW1+sA1hgIjkB8+iHR8TthNk7cs1JHZc/MHerV2IbN</Encrypted>]]>&ext;<![CDATA[<Encrypted>&LTpabyia7LjFJgPs/FV63hd8KBU/TeASLL38UXhPZGNb+mZmLyNwvPadxJRpjqdoIUQLM0+pA3ASu1ftd2kP7DIwJ5lRtuhcRroUI0HBZEEu7Jh00WNlAFTGnsMh8PDgFHGA8Tk1CzHO8tWnJPDkuSFk9gxJLBMdSmaBPXh5F1FyzTmQ0mdof8TAT4tANfZjW2Ff2dfanlGWcxaseZ+j6PovdkNOoB7CWy8AtyYIj5U+n9rLe8cZ8cQ5t9OBnFHW+KUlJukx3OCOI0QoYQd+L8QmXKjv4gpWcdwukJrgtnDrh8eLu9/IpwVkoRT1tcsdL2P3GXVyBtltzl5IfHgUfsAn4cVt0dRZ1LHqicwvI/tdITWAVLUUiiLn9tbcuVg9p/Ma4QPn+GjppH7fOCJC80tXs4JIBZfdTOnnBFkbt3oro76j7kxcuW6foggNgemO4lAtmqhiBZ0r9jFhSgW6MyKVHWN5z4Y45xAdP8C/TD9d0grErVru64SIfE0XKOz+P4eJNcvb47GG/8oS+ibu/4Sypv37rD0N3gtjY0i3GqvsjcNvNfIZFA5jb6pq4KJFqH41NMgS3RPr0WyVCa9s27TAz8oHfbdrHNZiOtH0y5gZvR/RdGdHsyXhs5Pc2SS9AOf7cQTVvJSbfup9gCwfAY68JO+KJOrQGymY2DgVZj8c+7HHGicfeX5NmBxpjLbXkBgizkP2Spw2d0/N6NijI8bi5ZFIJ47rSqca10X0IjIXvsPPqk2vIGPcLT6vpOV5w6e7MtqJG8Amob/IHA5c2DuvwSf726UFWiakaqOl7g+nCRCDPd7ef5egqYKhBIiRYolTQ1Pir0/qW1s0rg2KpA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22eEm5qmMQlho0ttA5U48xNjCuH+f6Z3dlEF8byEYYRDF+e8IfRxNQDjyfYo6dj7jWk/SfCyS+D4aF4MLHo/GTAKN1zdmYRUXRBQpAsjCPTzP</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6WdT6wm/xGhECCctmJuTUnhRR3L5YuE4U9QAKLE4OgNGnvLLINRLUIgQq7Ydcz6xRWvQF4z/5XEnrR5qNo9Y6BeX8Oc4rnKU77F9T5clG8Zx7F1O9SdzZ5A/DE/wIbWYpD3A9/HR1L2j7xzEIXW7T5LBwFs1iulBz1lXdvj4MjKwiEkyBnRrd1qvbc7jiBPCfxBPVb7T7EN273+Gw/E94WGWJwBHjAcZz/qKoflJrDlapKvzQ3rKWLBIuKFxEGAbs0TJ9sygW6LuUYdUDYdYAkWnsEfUsI8yMWETs4kq6TP9nrMvqOD2C8qZ291q3dDGrmwUfEPxHrHrEUjR3F+FEM5vi7zLbWuEPZrys0+hQM3JY5+DDOuVJ/MxRhrP3nObrDE/jkMp5TMSoL1gT5H4K3NmwGQ9PkHPKxcW7kcBwdrW0LsPa6VrGGl+kv/0ReZjNU6zIuWyYaG6Tybo2SEA+58hOPQNqdx0VTud0nMvd9CMvGa1RcccegJEbuX1oF/j2EGAEe2ZWmo64XclUGjbGbZ3QcvW+wXS8W+8C0FFp3m0f98ydp9fsusBzb9J0Ls5NQN/UPE58RCo+QJHO2hz3xlDf+LXszy8Rr2SoxYRk5FIzkCZibZxmdPswLcuCSlAKhclWgX3qIOjmT33sru8m85cOYk4TOrDqZpE28g+bUjbNR4LxAnbP94OgpUzmZRHo0MMORzRWpcidX9PXoXt9Mia8SGTQ8MB7NML8JD8nC9zzPdO20rmtxoSlxWsIZIt18=</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>