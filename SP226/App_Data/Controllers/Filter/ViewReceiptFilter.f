<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFilterCommand SYSTEM "..\Include\XML\FlowFilterCommand.txt">

  <!ENTITY Identity "ViewReceipt">
  <!ENTITY c11 "Phiếu nhập từ ngày">
  <!ENTITY c12 "Receipt Date from">

  <!ENTITY c21 "Số phiếu nhập">
  <!ENTITY c22 "Receipt Number">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'ViewReceiptFilter', 'Filter', '*'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="r70$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Xem phiếu nhập" e="View Receipt"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="&c11;" e="&c12;"></header>
    </field>
    <field name="loai" dataFormatString="1, 2, 3" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Hóa đơn trong nước, 2 - Nhập khẩu, 3 - Khác" e="1 - Domestic Invoice, 2 - Import, 3 - Other"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&zUpOjW5SsWLifX9NoDzKgkfAcamtgJ/Q1burVCjHuXjDKRFBXzACtdbKgcQovwHf</Encrypted>]]></clientScript>
    </field>
    <field name="ma_ct" readOnly="true" hidden="true">
      <header v="" e=""></header>
      <items style="Mask"/>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="false">
      <header v="&c21;" e="&c22;"></header>
      <items style="AutoComplete" controller="&Identity;Lookup" reference="stt_rec_id"/>
    </field>
    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_id" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 100, 100, 30"/>
      <item value="1101111: [ngay_ct1].Label, [ngay_ct1], [ngay_ct2], [stt_rec_id], [stt_rec_ct], [ma_vt]"/>
      <item value="1110011: [loai].Label, [loai], [loai].Description, [ma_ct], [ma_kho]"/>
      <item value="1101111: [so_ct].Label, [so_ct], [stt_rec_ct], [ma_dvcs], [ma_vi_tri], [ma_lo]"/>
    </view>
  </views>

  <commands>
    &XMLFlowFilterCommand;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/yXQIwe6+W8WUwOdr0Fl1eX5L9QK50Yt9Kn6ao098Fb3LndAwMMupUvoGWOz6AE04TKW8z/FGCBzwSjjt9twLmJ+fkb0FjceKdhbjnD/zbwbGWEUqL3EJg8cgu/vaSKi55jiBOoeoRST0/Sf3jmpHonSPqqJaes+FmCCBKAY4Qk1/xg6bdFPijb26AZ8918U3J2xsfez5GKPK74/w0ZzpxitZCzIpv8purpzqInc9VSpZHRchzmlDlbTz9Yq4YdvH7IrkMr5PpZh87gaK6VAY58z08tLAoyAYAmao+/hhBd58qCf1E1hS/BjeC/fM9TVkgdOKUwnnDly30iZ+4qqm8s4H6WPVPyFAjoecPDXDaWD0M3jSmY6TcmQvrJrycw8GiRFq/3RhcAme04BpAo1l9+nsdusy5YSmT6XBzl4uoj2ssKNNfMtE9d3mPCarDxyLTYpZbBMD/1ig+KqT9SZv6ask7RAEWBRjV6ILM6nWHCgm1tVhbSq3eHFvqDz2GO2+1PnLXoLi3lZgqxsI3yixnvUmSTF+YTwxXCwDiBGU/io5xhttb4h7SJ8XoAA5GdiOhzOb+6qSCWdKK6TTOSydA=</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WqA+8etVg+8aQhCRmJPOkw9RbUb03hbwg5NtH/eeyfW7drRKXNFI6PuB2CN5tn+jPZKDY/B6yb+5qaA+vzXM3iwmXdqybQeUNbAP64VcpwMK7PdsbHtpTaGtcUoDHDBzn5YoU8HsbIynww3Zc52hEwzftamkK8N6fB/jjtCrjnkO5kvyfvTnlJ/4tPoKk6KUOlB0M/rn3fkR2A3xuZ6Ffbz6R8GtQfeHzvBL8t0auzG4ZuKwM7HmrYr9wKEinJw1fpA9206DfV2X40lFzz1D+NzwoAeV4shgftFaeWUSx2jSP5DrQxadTxVJxIn5sT7gxavs3NL5vHUovjHYHF2TaEghfO3/EU0wXhJBEUVWqBZoSldCCzDLcqAN8HERd9Oi6ZJV17h/WHNp8GwEOlYKWz5SqqG+/ncEcn3Se3emArro7CXeLgnAI0+kgtvXNxWsIHBQ+qnNeyplEoRxaJou4qvHJKJ2ZYd9P7Co4o8OaUnr2ti7AbJ9+QOCVnMbmLVzzTBmu1FTpCYaaZN1+zwVVZDbzrtijHvayfETqE0TjRF0NL8RY+IzJxDEHVBBRmMkzKGP6FU1eJtQ0+VvLXEDJ7d332al70F31e73QVlqcU0e9YpNfUBtP8MWe+t0swpKdGvhR2BjPGx0L1jWKnsPZk1RNQsNCoyghWhs9fG+qFKzICINgofSwnbPYg3+JWQ3O5+1Q84Grq9KgLLcSk4gf3F6eh3Fgd2gtGh1Yq8P1IZ4yRXRSRw1j9nZ97EaH59T2AiD5Qlc3csnrp2PUQ6f17ZkSLMyEAHuS4yjStSLsR08sXMAr6tFJCpgYJwKXx5rlj+BBRKsbO+l1px/NNqwi9+jKp66ci/y+ARL7/Z3tIvTB3o9vITBhbN7jd5SCgWrqYlXQhdTNpXoQ8CtMXZJvjvjkmJB1mliwGcQ6Pda9AH0O1Wuv56240L9/Eo5sT2Z0jkIMNibgTKLN8pOjuvl4a7nlJf3WCPkWd4E38W1QGY24/YDrUQA1vVxJ1EJbIJHkhbvTqYUKMetsxWyu5iPPAl/gE61Ksl8CgWVCRLu2KeCqZ25ijrDjC7dtpzGpG/dR+ghrd1vRaxx+7fXQmIJMoCucOo0d3S7l6YopF6pwL/87AByfMNZk8xRV3JU3OpTG+iL6FpGsLWlkDLZqUUWeex0qLAz+VpxDt4/MG5CmAo+uOAWF9wn/LwY5GOrHpVqSdQRYv0KwAJ+GvnDfX5+v2F3tTQkCdrbmPxEuuC68tskhp900HdniMTvv4flvHocWmRZuRzCOvXHHyWNJMXombLb+kALH/jsmlertebYnTWPRRIcsOg/yelqkwneBaDqg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrILlvp9rLAK12lTQwy7GY23t0YZRTrrgsFEq+h6mzWJB9wZZXPrZAhhniC91DCu48sPvySgJc+FhJ2AW/4kAahy</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3jZH/Y+kmJHLG82qfV6ZYGzLXuPutwXI/+ZvAYz1FIj+RF0XtijdKglsDtySERQ3mQ==</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6UyQlxYd38nmmMqZbDvJFJl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3uXgOXXvjxA3dwhlTKHt0y5Q7e+utx8j0g9+ZssqVKn+TuBXnhcYK4I3XqpglqOq+6ySi4j/Tv4lCqcEL0MUAWaqAqBgbPm3rtnxCOElEBj8gGQPUuOsmMLrwv1manfBsA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWKciZtO3jhZffO9EJzsdj9EsiaBUE747e//3RnkUwb7Wp7g+V9Raf23CaYJ4oqqB8ywXXz7fWEI4+F4eKwQJqXADJN/D72KtvWBAStoXeMAP7P1Q8SW5YYtckwyeB3sJ6yL4B2O6fT05nxkm3DcnqQ3gyXtlM4WqZZfCg4zCUYptfF++Jn5lO751EKwIz0xwgcKNJJJx3OBLiDm9sX+1Q0U24w5SJ0QgGZVS236JUCVa0ivWrqY50wdY5dVdnXiG6t0qLRRBnE9kIpCT5J7uZDEd7Exf5ohP3tqHmZqJt0AhgxXdnki73de2vwmLdwFDeFIyg9529hNxkzqCkHLW2dRTIxlYpkUkJFEwNsEG9AJoiMt+nzs6lwTP+3vhKvmYNQ+FOf6j8UyIJKVd3BfW69cFPRqd9YfYmE2g9lbzEuTQ0uptbxHXFER42+NMAekoHoalMKqYlXCQwvEfvzd5+/Dak/g+it03HIEy87Qwp+uNg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3qeBZQhxWm9N1jRkDfSC40OHkd2DXY0N0S9OSWHXjUiFW+QJt4fV8dVINzErNnhRZdgmMtp+5Wi+CtdIuC9Swcw=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWLvVtIzZaYyscvaN2EfgqlNzr5CBr8L6XnwsuxeQoiUffsWo+UJaxSPxz5Na+JgujI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3kCJW2Pzdggi4gbFfJ3IRWJU3Q/gxDYqfge8tsRmI8i84cnz3Wi/GNTfZnsrmecK6K4PlOMiTne8O7Fp3LkIovzffOx2G0Cv7F6PyHlc07cq7zdDIHNFn6Ro5j8ECt/ahr99pG7IUuOkGR9qMvzfy4skecorHnD/Ja0MP/97+ZitolYBy7JPh0staIMZYiYRuQ0MrqzhuKjcIUHrbw6cSCOa1wUDkf4erlYqHQKmfZnk7rVrjNxGeG/fyHmnw7I+mROCPsRUNMqTO0ZRq66KnqTK6ej6ZGnErZ4jHs8vh4SzyW0RSFzD/+CWdtFyxFGwHFSxGjgI6g3b9soShpgSlB6Vhr2ux9CwVv2KbtyIqYqkDE5HCxddoqq5AP73pfkqK0Rne8ofmDZ1A6i2OQh1vAZMhAe4wJlZ3SO8sZTs7uqgdSUhJ9vnHnTikyGdrq5XkLa3swE6xzwI0OijhR/LjSY=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&zUpOjW5SsWLifX9NoDzKgk5OdT33qP4U0+9/Zwl1o0p1uxJwoHfRqmeP6xho/utpJLOczvPzQjyJqvkETBpsw7KhOcmf1hfcPAq/zHDzlfQe4kLiFN8PM31hBi9LwUW/UQa+XBi12P2pHvBKi3DcHTYOSqN8+i0Zm9tIeeyEew/BL6o+X0qszPdDO8Udu45JIvHpC4NT+dflZoFeh9xCpCFLE122ok263n4xg80vdog=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3hBvhiM3L1mWpQV78FCxGrIOAxiasI9WCx85jWEGRUB2SkIIj/IcAdV1IHTlDqt5f0xuIVvNdjfwVshN18PupePqrMTVZSzFnmc6zF8DjWWeCTb8sC6eFkZnDvGfri6B0KteX/xCEuVHSfYCB+J/xEarQnSneOqpUwAAfJ2533GeAwuJ3/TJVOF7/4bVNuGaxUAUs6I6zsKYM/rP0BP/HSBjDZxHohZ0awL9FVJSWMsF</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rOObb4GYbMQh3I9s9ieQaHpIADmf3Zpjb/8k4zF7m6T/u1TzqShGBxpUAu5127UusTrxarW8dYLPzz+Zk9uVkA7gwqMvC5ssvkAYicf30G5VyG+RSCZAeR+J+RV6Gn2tCrwyFZPOGm8IckRAOpy0/Bhfw+/pogGcamgiriZauYohtgs/GsiyT34xyp0ufMpLR1l6556reXZ7q64waoCHPPyyylUzAbZpBUeEZ6yuwqU/0O/LzKH0mIxuDed0Uvj8t9qXvIBpO0nP0qd74BMYoN9eZDBAD5POnX/VNU4CaVbH3b4LOkzlsuF11vRnxRCRCAvYZ8Ykb8vN0f6g4jW3/jJ4HN/7N0ScpsDuTCg/hsBQO5uuqP1vtwdqQCFR5iUXA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3h+SiKcLqRpRWTc4QsvVKis/VfRlByYlw+REdiKN5/NbLG+yA/meJtd3W6ZYIaEOSg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXaG6MOIyfQarKWuqjLzMOlptFUWubgnVIuYZablaQwaDu2vZhBKNSDt3Y3atSKS7c=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3rS4dIrGtn/zbuBqcIGW4sXRCVyIHPMsvxP9FBNO3u0Zb3QtXCy+Xnv4G8myohHaVLrNwbuwDXa5ezmruaXKdh+ejP+vcLMUDpsL4lsDyd83</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+gKiC6xPy9JobHU4BTBgEbEtJzVjcaQgt7DJSBdZIDAaFbLMKxWYc1sxkYdu0Ib+9QLlIaW4a9X0+6QyleaV6HFNRUTH20mXjS787H6keyt</Encrypted>]]>
    </text>
  </css>

</dir>